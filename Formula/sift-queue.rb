class SiftQueue < Formula
  desc "Queue CLI and queue-native task/review substrate"
  homepage "https://github.com/DerekStride/sq"
  version "0.9.0"
  license "MIT"

  on_arm do
    url "https://github.com/DerekStride/sq/releases/download/v#{version}/sift-queue-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "d8fc07f9fa9d74f872f43c09718aba57934cd652cc1d491231689fcc0549c530"
  end

  on_intel do
    url "https://github.com/DerekStride/sq/releases/download/v#{version}/sift-queue-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "03b566c4edb26667243ffdc889c1b5e4f9751351d1f7b0cbd4c65eadbb69d6ae"
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
