# SMRT Treatment Management System (TMS) - Shared Management of Radiation Treatments v0.0.2-current

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SMRT Treatment Management System (TMS)**

## CapabilityStatement: SMRT Treatment Management System (TMS) 

| | |
| :--- | :--- |
| *Official URL*:https://profiles.ihe.net/RO/SMRT/CapabilityStatement/IHE.SMRT.tms | *Version*:0.0.2-current |
| Draft as of 2026-06-19 | *Computable Name*:IHE_SMRT_tms |

 
Requirements CapabilityStatement for the **Treatment Management System (TMS)** actor of the IHE-RO Shared Management of Radiation Treatments (SMRT) Profile. 
The TMS is the device-specific subsystem. For the FHIR-message transactions defined by this profile it: 
* **responds to** Sync Patient Photo [RO-SMRT-01] and Report Treatment Approval [RO-SMRT-03];
* **initiates** Report Planning Artifacts [RO-SMRT-02], Report Treatment Artifacts [RO-SMRT-04], and Report Image Review Results [RO-SMRT-05].
 
To complete the workflow, the TMS is grouped with actors of other profiles for patient demographics/encounters (IHE-ITI PAM [ITI-30]/[ITI-31], HL7 V2 ADT), scheduling and check-in (HL7 V2 SIU), and prescription summary (IHE-RO XRTS [XRTS-08], with the Support Prescription Option). Those exchanges are out of scope for this FHIR CapabilityStatement. 

 [Raw OpenAPI-Swagger Definition file](IHE.SMRT.tms.openapi.json) | [Download](IHE.SMRT.tms.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "IHE.SMRT.tms",
  "url" : "https://profiles.ihe.net/RO/SMRT/CapabilityStatement/IHE.SMRT.tms",
  "version" : "0.0.2-current",
  "name" : "IHE_SMRT_tms",
  "title" : "SMRT Treatment Management System (TMS)",
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
  "description" : "Requirements CapabilityStatement for the **Treatment Management System (TMS)** actor of the IHE-RO Shared Management of Radiation Treatments (SMRT) Profile.\n\nThe TMS is the device-specific subsystem. For the FHIR-message transactions defined by this profile it:\n\n- **responds to** Sync Patient Photo [RO-SMRT-01] and Report Treatment Approval [RO-SMRT-03];\n- **initiates** Report Planning Artifacts [RO-SMRT-02], Report Treatment Artifacts [RO-SMRT-04], and Report Image Review Results [RO-SMRT-05].\n\nTo complete the workflow, the TMS is grouped with actors of other profiles for patient demographics/encounters (IHE-ITI PAM [ITI-30]/[ITI-31], HL7 V2 ADT), scheduling and check-in (HL7 V2 SIU), and prescription summary (IHE-RO XRTS [XRTS-08], with the Support Prescription Option). Those exchanges are out of scope for this FHIR CapabilityStatement.",
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
    "documentation" : "The TMS exchanges SMRT FHIR messages with the ROIS. The specific message definitions are provisional; see Volume 2 transaction definitions and the [Open Issues](issues.html).\n\nPatient and appointment synchronization may be carried over HL7 V2 (ADT/SIU). Those exchanges are out of scope for this FHIR CapabilityStatement."
  }]
}

```
