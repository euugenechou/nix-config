final: prev: {
  rPackages =
    prev.rPackages
    // {
      httpgd = prev.rPackages.buildRPackage {
        name = "httpgd";

        src = prev.fetchurl {
          url = "https://cran.r-project.org/src/contrib/Archive/httpgd/httpgd_2.0.3.tar.gz";
          sha256 = "sha256-vVp4T3zVR5v6KRMUiCy5/aLen0t+aX3ODl/99UBp6Qo=";
        };

        propagatedBuildInputs = with prev.rPackages; [
          unigd
          cpp11
          AsioHeaders
        ];
      };
    };

  rForResearch = prev.rWrapper.override {
    packages = with final.rPackages; [
      languageserver
      lintr
      tidyverse
      httpgd
      here
      ggthemes
      cowplot
      ggsci
      Hmisc
    ];
  };
}
