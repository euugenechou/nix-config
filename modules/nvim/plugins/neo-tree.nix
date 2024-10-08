{
  enable = true;
  enableDiagnostics = true;
  enableGitStatus = true;
  enableModifiedMarkers = true;
  enableRefreshOnWrite = true;
  closeIfLastWindow = true;
  hideRootNode = true;
  filesystem = {
    followCurrentFile.enabled = true;
    filteredItems = {
      visible = true;
      hideDotfiles = false;
      hideGitignored = true;
      hideByName = [".git" ".DS_STORE"];
      forceVisibleInEmptyFolder = true;
    };
  };
}
