class TiresMock {
  static const responseListTiresMock1 = <String, dynamic>{
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

  static const routeListTires =
      "/api/v3/tires?branchOfficesId=215&pageSize=10&pageNumber=1";

  static const responseListTiresMock2 = <String, dynamic>{
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

  static const route2ListTires =
      "/api/v3/tires?branchOfficesId=215&pageSize=10&pageNumber=2";

  static const responseListTiresMockVazio = <String, dynamic>{
    "content": [],
    "pageSize": 10,
    "pageNumber": 2,
    "numberOfElements": 1,
    "empty": false,
    "lastPage": true,
  };

  static const routeDetailTireInstalled = "/api/v3/tires/1234";

  static const responseDetailTireInstalled = <String, dynamic>{
    "id": 1234,
    "serialNumber": "1016",
    "companyGroupId": 15,
    "companyGroupName": "Empurrada",
    "branchOfficeId": 215,
    "branchOfficeName": "São Paulo",
    "currentLifeCycle": 2,
    "timesRetreaded": 1,
    "maxRetreadsExpected": 1,
    "recommendedPressure": 110.0,
    "currentPressure": 80.0,
    "middleInnerTreadDepth": 8.0,
    "outerTreadDepth": 8.0,
    "middleOuterTreadDepth": 8.0,
    "innerTreadDepth": 9.0,
    "dot": "0220",
    "purchaseCost": 1499,
    "newTire": false,
    "status": "INSTALLED",
    "createdAt": "2020-02-10T18:48:02.917093Z",
    "tireSize": {"id": 477, "height": 80.0, "width": 295.0, "rim": 22.5},
    "make": {"id": 382, "name": "Michelin MCs"},
    "model": {
      "id": 147,
      "name": "XZE2",
      "groovesQuantity": 4,
      "treadDepth": 15.0,
    },
    "currentRetread": {
      "make": {"id": 6, "name": "Bandag"},
      "model": {
        "id": 11,
        "name": "BTLSA2",
        "groovesQuantity": 5,
        "treadDepth": 15.0,
      },
      "retreadCost": 450,
    },
    "installed": {
      "vehicleId": 51881,
      "licensePlate": "MJL3274",
      "fleetId": "Teste Comercial",
      "installedPosition": 322,
      "installedPositionName": "3DI",
    },
    "registrationImages": [
      {
        "id": 1,
        "url":
            "https://s3.sa-east-1.amazonaws.com/prolog-movimentacao-fotos/descarte/1596459250586_AV0jXdXUXXIOZBVA_1.jpeg",
      },
    ],
  };

  static const routeDetailTireDisposalWithPhothos = "/api/v3/tires/12345";

  static const responseDetailTireDisposalWithPhothos = <String, dynamic>{
    "id": 12345,
    "serialNumber": "Pro 2053",
    "companyGroupId": 15,
    "companyGroupName": "Empurrada",
    "branchOfficeId": 215,
    "branchOfficeName": "São Paulo",
    "currentLifeCycle": 1,
    "timesRetreaded": 0,
    "maxRetreadsExpected": 1,
    "recommendedPressure": 110.0,
    "currentPressure": 92.15,
    "middleInnerTreadDepth": 30.0,
    "outerTreadDepth": 30.0,
    "middleOuterTreadDepth": 30.0,
    "innerTreadDepth": 30.0,
    "dot": "0219",
    "purchaseCost": 1499,
    "newTire": true,
    "status": "DISPOSAL",
    "createdAt": "2020-02-10T18:48:03.910878Z",
    "tireSize": {"id": 477, "height": 80.0, "width": 295.0, "rim": 22.5},
    "make": {"id": 382, "name": "Michelin MCs"},
    "model": {
      "id": 147,
      "name": "XZE2",
      "groovesQuantity": 4,
      "treadDepth": 15.0,
    },
    "disposal": {
      "disposalReasonId": 82,
      "disposalReasonDescription": "Corte lateral",
      "disposalImagesUrl": [
        "https://s3.sa-east-1.amazonaws.com/prolog-movimentacao-fotos/descarte/1596459250586_AV0jXdXUXXIOZBVA_1.jpeg",
        "https://s3.sa-east-1.amazonaws.com/prolog-movimentacao-fotos/descarte/1596459258317_fEOBl9zzQ2mGrUCG_2.jpeg",
      ],
    },
  };
}
