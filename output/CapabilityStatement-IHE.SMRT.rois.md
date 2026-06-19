# SMRT Radiation Oncology Information System (ROIS) - Shared Management of Radiation Treatments v0.0.2-current

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SMRT Radiation Oncology Information System (ROIS)**

## CapabilityStatement: SMRT Radiation Oncology Information System (ROIS) 

| | |
| :--- | :--- |
| *Official URL*:https://profiles.ihe.net/RO/SMRT/CapabilityStatement/IHE.SMRT.rois | *Version*:0.0.2-current |
| Draft as of 2026-06-19 | *Computable Name*:IHE_SMRT_rois |

 
Requirements CapabilityStatement for the **Radiation Oncology Information System (ROIS)** actor of the IHE-RO Shared Management of Radiation Treatments (SMRT) Profile. 
The ROIS is the central departmental system. For the FHIR-message transactions defined by this profile it: 
* **initiates** Sync Patient Photo [RO-SMRT-01] and Report Treatment Approval [RO-SMRT-03];
* **responds to** Report Planning Artifacts [RO-SMRT-02], Report Treatment Artifacts [RO-SMRT-04], and Report Image Review Results [RO-SMRT-05].
 
To complete the workflow, the ROIS is grouped with actors of other profiles for patient demographics/encounters (IHE-ITI PAM [ITI-30]/[ITI-31], HL7 V2 ADT), scheduling and check-in (HL7 V2 SIU), prescription summary (IHE-RO XRTS [XRTS-08], with the Support Prescription Option), and DICOM retrieval of the referenced RT objects (C-MOVE/C-GET/QIDO-RS/WADO-RS). Those exchanges are out of scope for this FHIR CapabilityStatement. 

 [Raw OpenAPI-Swagger Definition file](IHE.SMRT.rois.openapi.json) | [Download](IHE.SMRT.rois.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "IHE.SMRT.rois",
  "url" : "https://profiles.ihe.net/RO/SMRT/CapabilityStatement/IHE.SMRT.rois",
  "version" : "0.0.2-current",
  "name" : "IHE_SMRT_rois",
  "title" : "SMRT Radiation Oncology Information System (ROIS)",
  "status" : "draft",
  "experimental" : false,
  "date" : "2026-06-19",
  "publisher" : "IHE Radiation Oncology Technical Committee",
  "contact" : [{
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.ihe.net/ihe_domains/radiation_oncology/"
    }]
  },
  {
    "telecom" : [{
      "system" : "email",
      "value" : "jill@aapm.org"
    }]
  },
  {
    "name" : "IHE Radiation Oncology Technical Committee",
    "telecom" : [{
      "system" : "email",
      "value" : "jill@aapm.org"
    }]
  }],
  "description" : "Requirements CapabilityStatement for the **Radiation Oncology Information System (ROIS)** actor of the IHE-RO Shared Management of Radiation Treatments (SMRT) Profile.\n\nThe ROIS is the central departmental system. For the FHIR-message transactions defined by this profile it:\n\n- **initiates** Sync Patient Photo [RO-SMRT-01] and Report Treatment Approval [RO-SMRT-03];\n- **responds to** Report Planning Artifacts [RO-SMRT-02], Report Treatment Artifacts [RO-SMRT-04], and Report Image Review Results [RO-SMRT-05].\n\nTo complete the workflow, the ROIS is grouped with actors of other profiles for patient demographics/encounters (IHE-ITI PAM [ITI-30]/[ITI-31], HL7 V2 ADT), scheduling and check-in (HL7 V2 SIU), prescription summary (IHE-RO XRTS [XRTS-08], with the Support Prescription Option), and DICOM retrieval of the referenced RT objects (C-MOVE/C-GET/QIDO-RS/WADO-RS). Those exchanges are out of scope for this FHIR CapabilityStatement.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "001"
    }]
  }],
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["application/fhir+xml", "application/fhir+json"],
  "messaging" : [{
    "documentation" : "The ROIS exchanges SMRT FHIR messages with the TMS. The specific message definitions are provisional; see Volume 2 transaction definitions and the [Open Issues](issues.html).\n\nPatient and appointment synchronization may be carried over HL7 V2 (ADT/SIU); artifact retrieval uses DICOM. Those exchanges are out of scope for this FHIR CapabilityStatement."
  }]
}

```
