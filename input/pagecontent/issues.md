
## Significant Changes

### Significant Changes from the Template

- Established the SMRT profile scope: a **Workflow and Content** profile connecting a device-specific Treatment Management System (TMS) with a single departmental Radiation Oncology Information System (ROIS).
- Defined the profile actors **ROIS** and **TMS** (replacing the template's placeholder actors and the REST query / `REPO` actor model).
- Defined the **Use Case #1: Shared Management of Treatment** and its basic process flow.
- Defined a provisional set of nine transactions (RO-SMRT-01 through RO-SMRT-09) and the **Support Prescription Option**.

## Issues

### Submit an Issue

Use the repository [issue templates](https://github.com/IHE/RO.SMRT/issues) to submit a public comment or feature request.

### Open Issues

- SMRT_001: Transaction identifiers (RO-SMRT-01..09), names, and Volume 2/3 section numbers are **provisional** and must be confirmed/assigned by the IHE-RO Technical Committee.
- SMRT_002: Define the artifact-retrieval actor/grouping. The use case retrieves DICOM RT objects from an object store ("OST" in the source sequence diagram); confirm whether this is an explicit SMRT actor or a required grouping with an existing DICOM (RAD) actor.
- SMRT_003: Choose the messaging for each transaction (HL7v2 ADT/SIU vs. FHIR messaging) and document it in Volume 2. The source materials use HL7v2 ADT for demographics, HL7v2 SIU for appointments/check-in, FHIR messages for artifact reporting/approval, and DICOM for retrieval.
- SMRT_004: Specify the FHIR message structures and content profiles for Report Planning Artifacts [RO-SMRT-04], Report Treatment Artifacts [RO-SMRT-07], and Image Approval [RO-SMRT-08], including how they reference DICOM RT objects (RT Plan, RT Record, images).
- SMRT_005: Define the Report Treatment USCDI Data [RO-SMRT-09] content based on the USCDI investigation (Procedures, Encounter, Care Plan/Assessment, Diagnostic Imaging, Clinical Notes).
- SMRT_006: Confirm relationship and boundaries with the IHE-RO TDW-II and XRTS profiles, and any HIS-facing exchanges (treatment summary, billing) that are out of scope for SMRT Phase 1.
- SMRT_007: Complete the security risk assessment and finalize required actor groupings (CT, ATNA, BALP audit profiling).

### Closed Issues

- *None yet.*
