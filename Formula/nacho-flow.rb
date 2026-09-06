class NachoFlow < Formula
  desc "Agent Supervisor & Model Dispatcher for coding agents"
  homepage "https://spicebox.dev/nacho-flow/"
  version "1.0.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v#{version}/nacho-flow-#{version}-darwin-arm64"
      sha256 "fdb34d7e558305bcfd58181136bc6f288b094415d189accb7b23342e52bc2d9d"
    end
    on_intel do
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v#{version}/nacho-flow-#{version}-darwin-amd64"
      sha256 "e886355698965aa410403bfdbd3d058481df2b635e96c5d6094198d0a380a89e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v#{version}/nacho-flow-#{version}-linux-amd64"
      sha256 "8ed022d1059dcf0103b6cebddab0e1f764df965269ca1a267f24ebf89a6a6efd"
    end
    on_arm do
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v#{version}/nacho-flow-#{version}-linux-arm64"
      sha256 "edba06c460d479f99a4149ef1760eb03fcc370f0a4cbb4d9d21213b01d734d9b"
    end
  end

  def install
    binary_name = "nacho-flow"
    if OS.mac?
      binary_name = Hardware::CPU.arm? ? "nacho-flow-#{version}-darwin-arm64" : "nacho-flow-#{version}-darwin-amd64"
    elsif OS.linux?
      binary_name = Hardware::CPU.arm? ? "nacho-flow-#{version}-linux-arm64" : "nacho-flow-#{version}-linux-amd64"
    end

    bin.install binary_name => "nacho-flow"
  end

  service do
    run [opt_bin/"nacho-flow", "run"]
    keep_alive true
    log_path var/"log/nacho-flow.log"
    error_log_path var/"log/nacho-flow.err.log"
    working_dir var
  end

  test do
    system "#{bin}/nacho-flow", "version"
  end
end
