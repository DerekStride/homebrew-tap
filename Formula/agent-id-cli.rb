class AgentIdCli < Formula
  desc "Portable identity registry for coding-agent sessions"
  homepage "https://github.com/DerekStride/agent-id-cli"
  version "0.4.2"
  license "MIT"

  on_arm do
    url "https://github.com/DerekStride/agent-id-cli/releases/download/v#{version}/agent-id-cli-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "e68137a7b430537eaeb862029fff7fa28c5d0e872e524d9b77c4e2ea1c3db680"
  end

  on_intel do
    url "https://github.com/DerekStride/agent-id-cli/releases/download/v#{version}/agent-id-cli-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "c88834019c77aca59d20a4712984ad5e63df22fc78a6ad428d40f2af4fab1f58"
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
