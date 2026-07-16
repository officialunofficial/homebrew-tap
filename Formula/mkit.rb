class Mkit < Formula
  desc "Content-addressed VCS for creative work (with pluggable notary adapters)"
  homepage "https://github.com/officialunofficial/mkit"
  version "0.4.1"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/officialunofficial/mkit/releases/download/v#{version}/mkit-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c7d566f11fd6c3a9b52420d06db11e04c1575ad6ad8170a84a22f6a5aac5c3f2"
    end
    on_intel do
      url "https://github.com/officialunofficial/mkit/releases/download/v#{version}/mkit-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d06c8bf67caef2317b6573c1f004c678b4061ee71443c0d6b3109be1880964ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/officialunofficial/mkit/releases/download/v#{version}/mkit-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ba56ebbc79406e6c342234bae61326899303b80b21cb96fa4b0bf932151aa043"
    end
    on_intel do
      url "https://github.com/officialunofficial/mkit/releases/download/v#{version}/mkit-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e8acb5eb68436977a5bf4b536200e0c486ba10fbf4bd93f26f8755f52fbe6db0"
    end
  end

  def install
    bin.install "mkit"

    # Included in release archives by .github/workflows/release.yml.
    man1.install "share/man/man1/mkit.1" if File.exist?("share/man/man1/mkit.1")

    # Included in release archives by .github/workflows/release.yml.
    bash_completion.install "share/completions/mkit.bash" => "mkit" if File.exist?("share/completions/mkit.bash")
    zsh_completion.install "share/completions/_mkit" if File.exist?("share/completions/_mkit")
    fish_completion.install "share/completions/mkit.fish" if File.exist?("share/completions/mkit.fish")
  end

  test do
    assert_match "mkit #{version}", shell_output("#{bin}/mkit version")
  end
end
