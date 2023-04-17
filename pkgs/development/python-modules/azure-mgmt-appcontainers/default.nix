{ lib
, buildPythonPackage
, fetchPypi
, isPy27
, azure-common
, azure-mgmt-core
, msrest
, msrestazure
}:

buildPythonPackage rec {
  version = "2.0.0";
  pname = "azure-mgmt-appcontainers";
  disabled = isPy27;

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-ccdIdvdgTYPWEZCWqkLc8lEuMuAEERvl5B1huJyBkvU=";
    extension = "zip";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-core
    msrest
    msrestazure
  ];

  # no tests included
  doCheck = false;

  pythonImportsCheck = [ "azure.common" "azure.mgmt.appcontainers" ];

  meta = with lib; {
    description = "Microsoft Azure Appcontainers Management Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = licenses.mit;
    maintainers = with maintainers; [ jonringer ];
  };
}
