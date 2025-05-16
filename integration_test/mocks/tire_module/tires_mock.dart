class TiresMock {
  static const responseMock1 = <String, dynamic>{
    "content": [
      {
        "id": 12345,
        "serialNumber": "PN0001",
        "additionalId": "123",
        "companyGroupId": 1,
        "companyGroupName": "Sudeste",
        "branchOfficeId": 215,
        "branchOfficeName": "Unidade de testes",
        "currentLifeCycle": 1,
        "timesRetreaded": 1,
        "maxRetreadsExpected": 5,
        "recommendedPressure": 120,
        "currentPressure": 120,
        "middleInnerTreadDepth": 15.2,
        "outerTreadDepth": 15.2,
        "middleOuterTreadDepth": 15.2,
        "innerTreadDepth": 15.2,
        "dot": "2035",
        "purchaseCost": 0,
        "newTire": true,
        "status": "INSTALLED",
        "createdAt": "2019-08-24T14:15:22Z",
        "tireSize": {"id": 1, "height": 80, "width": 195, "rim": 22.5},
        "make": {"id": 590, "name": "Continental"},
        "model": {
          "id": 137,
          "name": "HSR",
          "groovesQuantity": 4,
          "treadDepth": 16,
        },
        "currentRetread": {
          "make": {"id": 6, "name": "Bandag"},
          "model": {
            "id": 2,
            "name": "BTLSA2",
            "additionalId": "AAA123",
            "groovesQuantity": 3,
            "treadDepth": 14,
          },
          "retreadCost": 0,
        },
        "installed": {
          "vehicleId": 12345,
          "licensePlate": "PRO1102",
          "fleetId": "FROTA01",
          "installedPosition": 111,
          "installedPositionName": "111",
        },
        "disposal": {
          "disposalReasonId": 1234,
          "disposalReasonDescription": "Description on the disposal process.",
          "disposalImagesUrl": ["string"],
        },
        "analysis": {
          "recapperId": 1234,
          "recapperName": "Recapadora X",
          "recapperPickUpId": "12345678",
          "reason": "Envio para Analise da Recapadora",
        },
        "registrationImages": [
          {"id": 145, "url": "string"},
        ],
      },
    ],
    "pageSize": 100,
    "pageNumber": 1,
    "numberOfElements": 90,
    "empty": false,
    "lastPage": false,
  };

  static const route = "/api/v3/tires?branchOfficesId=215&pageSize=10&pageNumber=1";

  static const responseMock2 = <String, dynamic>{
    "content": [
      {
        "id": 12345,
        "serialNumber": "PN0001",
        "additionalId": "123",
        "companyGroupId": 1,
        "companyGroupName": "Sudeste",
        "branchOfficeId": 215,
        "branchOfficeName": "Unidade de testes",
        "currentLifeCycle": 1,
        "timesRetreaded": 1,
        "maxRetreadsExpected": 5,
        "recommendedPressure": 120,
        "currentPressure": 120,
        "middleInnerTreadDepth": 15.2,
        "outerTreadDepth": 15.2,
        "middleOuterTreadDepth": 15.2,
        "innerTreadDepth": 15.2,
        "dot": "2035",
        "purchaseCost": 0,
        "newTire": true,
        "status": "INSTALLED",
        "createdAt": "2019-08-24T14:15:22Z",
        "tireSize": {"id": 1, "height": 80, "width": 195, "rim": 22.5},
        "make": {"id": 590, "name": "Continental"},
        "model": {
          "id": 137,
          "name": "HSR",
          "groovesQuantity": 4,
          "treadDepth": 16,
        },
        "currentRetread": {
          "make": {"id": 6, "name": "Bandag"},
          "model": {
            "id": 2,
            "name": "BTLSA2",
            "additionalId": "AAA123",
            "groovesQuantity": 3,
            "treadDepth": 14,
          },
          "retreadCost": 0,
        },
        "installed": {
          "vehicleId": 12345,
          "licensePlate": "PRO1102",
          "fleetId": "FROTA01",
          "installedPosition": 111,
          "installedPositionName": "111",
        },
        "disposal": {
          "disposalReasonId": 1234,
          "disposalReasonDescription": "Description on the disposal process.",
          "disposalImagesUrl": ["string"],
        },
        "analysis": {
          "recapperId": 1234,
          "recapperName": "Recapadora X",
          "recapperPickUpId": "12345678",
          "reason": "Envio para Analise da Recapadora",
        },
        "registrationImages": [
          {"id": 145, "url": "string"},
        ],
      },
    ],
    "pageSize": 10,
    "pageNumber": 2,
    "numberOfElements": 1,
    "empty": false,
    "lastPage": true,
  };

  static const route2 = "/api/v3/tires?branchOfficesId=215&pageSize=10&pageNumber=2";

  static const responseMockVazio = <String, dynamic>{
    "content": [],
    "pageSize": 10,
    "pageNumber": 2,
    "numberOfElements": 1,
    "empty": false,
    "lastPage": true,
  };
}
