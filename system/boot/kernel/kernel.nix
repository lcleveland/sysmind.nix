{ config, ... }:
{
  config = {
    boot.kernelPackages = config.system.boot.kernel.kernel_package;
  };
}
