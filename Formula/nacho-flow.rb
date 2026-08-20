class NachoFlow < Formula
  desc "Autonomous multi-tier local/cloud LLM router with real-time pricing"
  homepage "https://github.com/dixieflatline76/nacho-flow"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v0.2.0/nacho-flow-0.2.0-darwin-arm64"
      sha256 "fbfdca1786ae12de8a5accf72e6b8cd0654f4ade894315641719ab6700039978"

      def install
        bin.install "nacho-flow-0.2.0-darwin-arm64" => "nacho-flow"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v0.2.0/nacho-flow-0.2.0-darwin-amd64"
      sha256 "853d4d8648c703174b5df6b68a87b91f75619b17488954964e00048a6efa436c"

      def install
        bin.install "nacho-flow-0.2.0-darwin-amd64" => "nacho-flow"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v0.2.0/nacho-flow-0.2.0-linux-arm64"
      sha256 "ed654514b2f8471bc68b9370169d3799fbda6498b2f5b73c6f9be9659270d914"

      def install
        bin.install "nacho-flow-0.2.0-linux-arm64" => "nacho-flow"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/dixieflatline76/nacho-flow/releases/download/v0.2.0/nacho-flow-0.2.0-linux-amd64"
      sha256 "3ad8ff3e7c3425a521e5eff49bbd632ab6061c87f2405e0c0cfa34ec4c399981"

      def install
        bin.install "nacho-flow-0.2.0-linux-amd64" => "nacho-flow"
      end
    end
  end

  service do
    run [opt_bin/"nacho-flow", "start"]
    keep_alive true
    log_path var/"log/nacho-flow.log"
    error_log_path var/"log/nacho-flow.err.log"
  end

  test do
    assert_match "Autonomous Multi-Tier LLM Proxy & Router", shell_output("#{bin}/nacho-flow --help")
  end
end
