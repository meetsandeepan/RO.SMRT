# Artifacts Summary - Shared Management of Radiation Treatments v0.0.2-current

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Behavior: Capability Statements 

The following artifacts define the specific capabilities that different types of systems are expected to have in order to comply with this implementation guide. Systems conforming to this implementation guide are expected to declare conformance to one or more of the following capability statements.

| | |
| :--- | :--- |
| [SMRT Radiation Oncology Information System (ROIS)](CapabilityStatement-IHE.SMRT.rois.md) | Requirements CapabilityStatement for the **Radiation Oncology Information System (ROIS)** actor of the IHE-RO Shared Management of Radiation Treatments (SMRT) Profile.The ROIS is the central departmental system. For the FHIR-message transactions defined by this profile it:* **initiates** Sync Patient Photo [RO-SMRT-01] and Report Treatment Approval [RO-SMRT-03];
* **responds to** Report Planning Artifacts [RO-SMRT-02], Report Treatment Artifacts [RO-SMRT-04], and Report Image Review Results [RO-SMRT-05].
To complete the workflow, the ROIS is grouped with actors of other profiles for patient demographics/encounters (IHE-ITI PAM [ITI-30]/[ITI-31], HL7 V2 ADT), scheduling and check-in (HL7 V2 SIU), prescription summary (IHE-RO XRTS [XRTS-08], with the Support Prescription Option), and DICOM retrieval of the referenced RT objects (C-MOVE/C-GET/QIDO-RS/WADO-RS). Those exchanges are out of scope for this FHIR CapabilityStatement. |
| [SMRT Treatment Management System (TMS)](CapabilityStatement-IHE.SMRT.tms.md) | Requirements CapabilityStatement for the **Treatment Management System (TMS)** actor of the IHE-RO Shared Management of Radiation Treatments (SMRT) Profile.The TMS is the device-specific subsystem. For the FHIR-message transactions defined by this profile it:* **responds to** Sync Patient Photo [RO-SMRT-01] and Report Treatment Approval [RO-SMRT-03];
* **initiates** Report Planning Artifacts [RO-SMRT-02], Report Treatment Artifacts [RO-SMRT-04], and Report Image Review Results [RO-SMRT-05].
To complete the workflow, the TMS is grouped with actors of other profiles for patient demographics/encounters (IHE-ITI PAM [ITI-30]/[ITI-31], HL7 V2 ADT), scheduling and check-in (HL7 V2 SIU), and prescription summary (IHE-RO XRTS [XRTS-08], with the Support Prescription Option). Those exchanges are out of scope for this FHIR CapabilityStatement. |

