class Kit < Formula
  desc "Content-addressed VCS for creative work"
  homepage "https://github.com/officialunofficial/kit"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/officialunofficial/kit/releases/download/v0.8.1/kit-0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "947b891e89b74306f6584480fad28bb5717942d73bd853807df0c5e2fd107239"
    end
    on_intel do
      url "https://github.com/officialunofficial/kit/releases/download/v0.8.1/kit-0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "8f570cbaf2f4a81d2c871ac9c7de8400f77505f0e93624f59486015342856630"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/officialunofficial/kit/releases/download/v0.8.1/kit-0.8.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1a33359b5b02f73cdb71ab9d29d3a1e4f72e242267f12bca6305d2f062cadeb7"
    end
    on_intel do
      url "https://github.com/officialunofficial/kit/releases/download/v0.8.1/kit-0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7c4ea04393985b3675813a0d5730709d605e2b668f116092d6c3378917955638"
    end
  end

  def install
    bin.install "kit"
    man1.install "share/man/man1/kit.1"
    bash_completion.install "share/completions/kit.bash" => "kit"
    zsh_completion.install "share/completions/_kit"
    fish_completion.install "share/completions/kit.fish"
  end

  test do
    assert_match "kit #{version}", shell_output("#{bin}/kit --version")
  end
end
