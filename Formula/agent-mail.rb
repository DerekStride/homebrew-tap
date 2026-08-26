class AgentMail < Formula
  desc "Local Maildir message bus for coding agents"
  homepage "https://github.com/DerekStride/agent-mail"
  version "0.2.0"
  license "MIT"

  on_arm do
    url "https://github.com/DerekStride/agent-mail/releases/download/v#{version}/agent-mail-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "1df29c89a89da2abdf5329aa91315a3cc70b99b193aacde1f00ba076fa43cfa4"
  end

  on_intel do
    url "https://github.com/DerekStride/agent-mail/releases/download/v#{version}/agent-mail-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "295ffa2e45f136b63c7411024181b033e4379fa5535f94da126c4c9de71b559e"
  end

  def install
    bin.install "agent-mail"
  end

  test do
    root = testpath/"mail"
    ENV["AGENT_MAIL_ROOT"] = root.to_s
    output = shell_output("#{bin}/agent-mail send --to receiver --from sender --body hello")
    assert_match(/\A[0-9A-HJKMNP-TV-Z]{26}\z/, output.strip)
    assert_match "Subject: (no subject)", shell_output("#{bin}/agent-mail read #{output.strip}")
  end
end
