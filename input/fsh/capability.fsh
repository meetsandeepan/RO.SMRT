// Requirements CapabilityStatements for the SMRT actors.
// These document, at requirements level, the SMRT transactions each actor supports.
// Detailed message and content definitions are provisional and will be elaborated
// as the transactions in Volume 2 and the content modules in Volume 3 are authored.

Instance: IHE.SMRT.rois
InstanceOf: CapabilityStatement
Title: "SMRT Radiation Oncology Information System (ROIS)"
Usage: #definition
* description = """
Requirements CapabilityStatement for the **Radiation Oncology Information System (ROIS)** actor of the IHE-RO Shared Management of Radiation Treatments (SMRT) Profile.

The ROIS is the central departmental system. In the SMRT Profile it:

- **initiates** Sync Patient Demographics [RO-SMRT-01], Sync Treatment Appointment [RO-SMRT-02], Report Treatment Approval [RO-SMRT-05], and Report Patient Check-in [RO-SMRT-06];
- **responds to** Retrieve Prescription Summary [RO-SMRT-03] (with the Support Prescription Option), Report Planning Artifacts [RO-SMRT-04], Report Patient Check-in [RO-SMRT-06], Report Treatment Artifacts [RO-SMRT-07], Image Approval [RO-SMRT-08], and Report Treatment USCDI Data [RO-SMRT-09];
- selectively **retrieves** the referenced DICOM RT objects from an object store using established DICOM transactions (C-MOVE/C-GET/QIDO-RS/WADO-RS).
"""
* url = "https://profiles.ihe.net/RO/SMRT/CapabilityStatement/IHE.SMRT.rois"
* name = "IHE_SMRT_rois"
* title = "SMRT Radiation Oncology Information System (ROIS)"
* status = #draft
* experimental = false
* date = "2026-06-19"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* messaging.documentation = """
The ROIS exchanges SMRT FHIR messages with the TMS. The specific message definitions are provisional; see Volume 2 transaction definitions and the [Open Issues](issues.html).

Patient and appointment synchronization may be carried over HL7 V2 (ADT/SIU); artifact retrieval uses DICOM. Those exchanges are out of scope for this FHIR CapabilityStatement.
"""

Instance: IHE.SMRT.tms
InstanceOf: CapabilityStatement
Title: "SMRT Treatment Management System (TMS)"
Usage: #definition
* description = """
Requirements CapabilityStatement for the **Treatment Management System (TMS)** actor of the IHE-RO Shared Management of Radiation Treatments (SMRT) Profile.

The TMS is the device-specific subsystem. In the SMRT Profile it:

- **responds to** Sync Patient Demographics [RO-SMRT-01], Sync Treatment Appointment [RO-SMRT-02], Report Treatment Approval [RO-SMRT-05], and Report Patient Check-in [RO-SMRT-06];
- **initiates** Retrieve Prescription Summary [RO-SMRT-03] (with the Support Prescription Option), Report Planning Artifacts [RO-SMRT-04], Report Patient Check-in [RO-SMRT-06], Report Treatment Artifacts [RO-SMRT-07], Image Approval [RO-SMRT-08], and Report Treatment USCDI Data [RO-SMRT-09].
"""
* url = "https://profiles.ihe.net/RO/SMRT/CapabilityStatement/IHE.SMRT.tms"
* name = "IHE_SMRT_tms"
* title = "SMRT Treatment Management System (TMS)"
* status = #draft
* experimental = false
* date = "2026-06-19"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* messaging.documentation = """
The TMS exchanges SMRT FHIR messages with the ROIS. The specific message definitions are provisional; see Volume 2 transaction definitions and the [Open Issues](issues.html).

Patient and appointment synchronization may be carried over HL7 V2 (ADT/SIU). Those exchanges are out of scope for this FHIR CapabilityStatement.
"""
