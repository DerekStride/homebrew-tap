class AgentMail < Formula
  desc "Local Maildir message bus for coding agents"
  homepage "https://github.com/DerekStride/agent-mail"
  version "0.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/DerekStride/agent-mail/releases/download/v#{version}/agent-mail-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "ca2569bc00b39883a40b1cd74302f238c5fa7e171dc77c124534adf004a61ce5"
  end

  on_intel do
    url "https://github.com/DerekStride/agent-mail/releases/download/v#{version}/agent-mail-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "469ef15ca88d14d532d54c6c4554f8803f7c31421c88876e52f9424b2ae078c0"
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
