class Mkit < Formula
  desc "Content-addressed VCS for creative work (with pluggable notary adapters)"
  homepage "https://github.com/officialunofficial/mkit"
  version "0.5.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/officialunofficial/mkit/releases/download/v#{version}/mkit-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "5722730d7e4e9f515306068d9984bc63d80715f400ca864b4b9b568af411a759"
    end
    on_intel do
      url "https://github.com/officialunofficial/mkit/releases/download/v#{version}/mkit-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "f9694687e6428c587328d96fa3e868b4651976a888dd9f4c8766f62b7f9375b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/officialunofficial/mkit/releases/download/v#{version}/mkit-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "622e78ba798c9fada3e362e5f53c6d4f27ca1bad0e42901cd50e368b331aadbc"
    end
    on_intel do
      url "https://github.com/officialunofficial/mkit/releases/download/v#{version}/mkit-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c3fd44f4ae55e420ef071544871caeca82a927fd3ddf9dd61c38ab9adb2b881e"
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
