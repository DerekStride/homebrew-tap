class AgentIdCli < Formula
  desc "Portable identity registry for coding-agent sessions"
  homepage "https://github.com/DerekStride/agent-id-cli"
  version "0.2.0"
  license "MIT"

  on_arm do
    url "https://github.com/DerekStride/agent-id-cli/releases/download/v#{version}/agent-id-cli-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "b1bf5734605f0a3e26bc0b81e6588ae28534e5d826f8352170aebbe04ab3d5db"
  end

  on_intel do
    url "https://github.com/DerekStride/agent-id-cli/releases/download/v#{version}/agent-id-cli-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "f8ff941912c06af1e90d3081c91d7f4736aadc92d2e7e5bd41542fbcbfb3aec2"
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
