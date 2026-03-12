class SiftQueue < Formula
  desc "Queue CLI and queue-native task/review substrate"
  homepage "https://github.com/DerekStride/sq"
  version "0.5.0"
  license "MIT"

  on_arm do
    url "https://github.com/DerekStride/sq/releases/download/v#{version}/sift-queue-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "44ecc227175aff740fbfabb887a544d021f2aef7d4e607da5f46cdba88679ab6"
  end

  on_intel do
    url "https://github.com/DerekStride/sq/releases/download/v#{version}/sift-queue-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "08dd763a55886eef46003290430e9332bea04311d0f11299e9d3576cd9054a3c"
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
