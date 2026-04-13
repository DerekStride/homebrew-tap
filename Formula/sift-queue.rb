class SiftQueue < Formula
  desc "Queue CLI and queue-native task/review substrate"
  homepage "https://github.com/DerekStride/sq"
  version "0.8.0"
  license "MIT"

  on_arm do
    url "https://github.com/DerekStride/sq/releases/download/v#{version}/sift-queue-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "f6b50b99c77f0d43061793e076541fa10425bbe737247b0e69a40d213d8c4ba7"
  end

  on_intel do
    url "https://github.com/DerekStride/sq/releases/download/v#{version}/sift-queue-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "951f7f7b60433af3aecb3339138b0a72fcb965dc7700fb9c783584d5e6ce1e33"
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
