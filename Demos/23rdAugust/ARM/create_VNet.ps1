{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "vnetName": {
      "type": "string",
      "defaultValue": "VNet1",
      "metadata": {
        "description": "VNet name"
      }
    },
    "vnetAddressPrefix": {
      "type": "string",
      "defaultValue": "10.0.0.0/16",
      "metadata": {
        "description": "Address prefix"
      }
    },
    "subnet1Prefix": {
      "type": "string",
      "defaultValue": "10.0.0.0/24",
      "metadata": {
        "description": "Subnet 1 Prefix"
      }
    },
    "subnet1Name": {
      "type": "string",
      "defaultValue": "Subnet1",
      "metadata": {
        "description": "Subnet 1 Name"
      }
    },
    "subnet2Prefix": {
      "type": "string",
      "defaultValue": "10.0.1.0/24",
      "metadata": {
        "description": "Subnet 2 Prefix"
      }
    },
    "subnet2Name": {
      "type": "string",
      "defaultValue": "Subnet2",
      "metadata": {
        "description": "Subnet 2 Name"
      }
    },
    "location": {
      "type": "string",
      "defaultValue": "[resourceGroup().location]",
      "metadata": {
        "description": "Location for all resources."
      }
    }
  },
  "variables": {},
  "resources": [
    {
      "type": "Microsoft.Network/virtualNetworks",
      "apiVersion": "2020-05-01",
      "name": "[parameters('vnetName')]",
      "location": "[parameters('location')]",
      "properties": {
        "addressSpace": {
          "addressPrefixes": [
            "[parameters('vnetAddressPrefix')]"
          ]
        }
      },
      "resources": [
        {
          "type": "subnets",
          "apiVersion": "2020-05-01",
          "location": "[parameters('location')]",
          "name": "[parameters('subnet1Name')]",
          "dependsOn": [
            "[parameters('vnetName')]"
          ],
          "properties": {
            "addressPrefix": "[parameters('subnet1Prefix')]"
          }
        },
        {
          "type": "subnets",
          "apiVersion": "2020-05-01",
          "location": "[parameters('location')]",
          "name": "[parameters('subnet2Name')]",
          "dependsOn": [
            "[parameters('vnetName')]",
            "[parameters('subnet1Name')]"
          ],
          "properties": {
            "addressPrefix": "[parameters('subnet2Prefix')]"
          }
        }
      ]
    }