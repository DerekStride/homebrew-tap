class AgentMail < Formula
  desc "Local Maildir message bus for coding agents"
  homepage "https://github.com/DerekStride/agent-mail"
  version "0.2.3"
  license "MIT"

  on_arm do
    url "https://github.com/DerekStride/agent-mail/releases/download/v#{version}/agent-mail-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "cb6ed88b03eb3e17b4714d407d60f068d1ff108f44fbd0766129921d8f7ac60c"
  end

  on_intel do
    url "https://github.com/DerekStride/agent-mail/releases/download/v#{version}/agent-mail-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "d4bd633308399774f5268523a7a02c404b98fe1415955bbebe7f258fde2fd7ef"
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
