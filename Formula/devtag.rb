class Devtag < Formula
    desc "Play an audio clip whenever you git push or pull"
    homepage "https://github.com/kelvinxiao01/devtag"
    url "https://github.com/kelvinxiao01/devtag/archive/refs/tags/v0.3.0.tar.gz"
    sha256 "2f371e454119d1643b8c1682eeb8f57e04f636ce04073a2195b0177db3ddf7e9"
    license "MIT"
    head "https://github.com/kelvinxiao01/devtag.git", branch: "main"
  
    depends_on "go" => :build
    depends_on :macos
  
    def install
      system "go", "build", *std_go_args(ldflags: "-s -w")
    end
  
    def caveats
      <<~EOS
        Finish setup with:
          devtag set /path/to/your/audio.mp3
          devtag install

        Optionally give push and pull different sounds:
          devtag set push /path/to/push.mp3
          devtag set pull /path/to/pull.mp3

        Upgrading? Re-run `devtag install` so the hooks pick up new events.

        `devtag install` sets git's global core.hooksPath to ~/.devtag/hooks.
        To remove later: `devtag uninstall`.
      EOS
    end
  
    test do
      assert_match "Usage", shell_output("#{bin}/devtag --help")
    end
  end
  