class SiftQueue < Formula
  desc "Queue CLI and queue-native task/review substrate"
  homepage "https://github.com/DerekStride/sq"
  version "0.6.0"
  license "MIT"

  on_arm do
    url "https://github.com/DerekStride/sq/releases/download/v#{version}/sift-queue-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "32438b449f2577bea253af8cc352a7af85e0acdb86cae9156f97a67cc6411721"
  end

  on_intel do
    url "https://github.com/DerekStride/sq/releases/download/v#{version}/sift-queue-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "903ada1a6348ff070e0fc4a0b9dc9812c3f4406570f73293a92cf3d63d5d9d49"
  end

  def install
    bin.install "sq"
  end

  test do
    queue = testpath/"queue.jsonl"
    output = shell_output("#{bin}/sq add --title test --description hi -q #{queue} --json")
    assert_match '"title":"test"', output
  end
end
