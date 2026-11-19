class Kit < Formula
  desc "Content-addressed VCS for creative work"
  homepage "https://github.com/officialunofficial/kit"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/officialunofficial/kit/releases/download/v0.9.0/kit-0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "d895fecedd8d740bd833a98333e7d2c60bb8e466440880e7020dc7883e2b1260"
    end
    on_intel do
      url "https://github.com/officialunofficial/kit/releases/download/v0.9.0/kit-0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "31862b1a30c5f9cfe596f1e9b1c49d1c86bbed2783b978d3d8b612992c605629"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/officialunofficial/kit/releases/download/v0.9.0/kit-0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c38f8fb5ece68a2ba9f85baf76030985215a5b6dc89508e97b52638aa85056c1"
    end
    on_intel do
      url "https://github.com/officialunofficial/kit/releases/download/v0.9.0/kit-0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3a73fdff889073551b702f441155174018cf88c4c645101f39946b489348d3af"
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
