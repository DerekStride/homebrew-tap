class AgentIdCli < Formula
  desc "Portable identity registry for coding-agent sessions"
  homepage "https://github.com/DerekStride/agent-id-cli"
  version "0.3.0"
  license "MIT"

  on_arm do
    url "https://github.com/DerekStride/agent-id-cli/releases/download/v#{version}/agent-id-cli-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "3b0214aa63322a1cb626c233aa98557e7707bf03634a68f1a1b81ebf7e00d20a"
  end

  on_intel do
    url "https://github.com/DerekStride/agent-id-cli/releases/download/v#{version}/agent-id-cli-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "5804ad97795f079f91a4091c2a9615870b68548681c5a829bb7b2aae3f55a3b4"
  end

  def install
    bin.install "agent-id"
  end

  test do
    ENV["AGENT_ID_HOME"] = testpath/"agent-id"
    ENV["AGENT_REALM"] = "Homebrew"
    output = shell_output("#{bin}/agent-id register test-session --json")
    assert_match '"session_id":"test-session"', output
  end
end
