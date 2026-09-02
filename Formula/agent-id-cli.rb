class AgentIdCli < Formula
  desc "Portable identity registry for coding-agent sessions"
  homepage "https://github.com/DerekStride/agent-id-cli"
  version "0.4.0"
  license "MIT"

  on_arm do
    url "https://github.com/DerekStride/agent-id-cli/releases/download/v#{version}/agent-id-cli-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "62315ebc09d3ddd7acd41dc0d99e731ccfaf87ac0e9c0ee80cda39aa1dc577d5"
  end

  on_intel do
    url "https://github.com/DerekStride/agent-id-cli/releases/download/v#{version}/agent-id-cli-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "f2553a63a9fb584b2abe6c12a35994f6c7be6b109965de89c095fc3a49c70b49"
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
