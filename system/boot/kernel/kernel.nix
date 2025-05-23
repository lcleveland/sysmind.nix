{ config, ... }:
{
  config = {
    boot.kernelPackages = config.boot.kernel.kernel_package;
  };
}
