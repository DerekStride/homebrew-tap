class AgentMail < Formula
  desc "Local Maildir message bus for coding agents"
  homepage "https://github.com/DerekStride/agent-mail"
  version "0.2.2"
  license "MIT"

  on_arm do
    url "https://github.com/DerekStride/agent-mail/releases/download/v#{version}/agent-mail-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "906d740b456f3c7c7930a477d77fcb58769902c9470c25a7c647448484679b0a"
  end

  on_intel do
    url "https://github.com/DerekStride/agent-mail/releases/download/v#{version}/agent-mail-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "2068476a5f7f66526724117833ba1d64fb81a02e385300b5b5ab86d9b09f2f66"
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
