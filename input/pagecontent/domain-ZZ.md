Volume 3 defines the content exchanged by the SMRT transactions: the FHIR messages used to report and approve artifacts, the way those messages reference DICOM RT objects, and the treatment data structured according to the United States Core Data for Interoperability (USCDI).

> **Editor's Note (provisional):** The content modules below are in development. The FHIR message structures, content profiles, and value sets have not yet been authored; this section records the intended scope and the candidate data so the IHE-RO Technical Committee can refine it. See the [Open Issues](issues.html).

## SMRT Content Modules

### FHIR Message Content (DICOM RT references)

The Report Planning Artifacts [RO-SMRT-04], Report Treatment Artifacts [RO-SMRT-07], and Image Approval [RO-SMRT-08] transactions convey their information in FHIR messages. Rather than embedding imaging payloads, these messages **reference** the relevant DICOM RT objects so that the ROIS can selectively retrieve them from an object store using established DICOM transactions (C-MOVE/C-GET/QIDO-RS/WADO-RS).

The principal artifacts referenced include:

- **RT Plan** — referenced by Report Planning Artifacts [RO-SMRT-04]; the main object, from which other objects (e.g., CT, RT Structure Set, RT Dose) may be derived or explicitly included.
- **RT Record** (RT Beams Treatment Record) — referenced by Report Treatment Artifacts [RO-SMRT-07]; the main object for delivered sessions.
- **Image** — referenced by Image Approval [RO-SMRT-08].

The FHIR content profiles for these messages — including how DICOM objects are referenced (e.g., via ImagingStudy / endpoints / identifiers) — are to be defined.

### Prescription Summary Content

The Retrieve Prescription Summary [RO-SMRT-03] transaction (Support Prescription Option) returns high-level treatment-strategy and prescription information. Alignment with the IHE-RO XRTS content and the [CodeX Radiotherapy](https://build.fhir.org/ig/HL7/codex-radiation-therapy/) profiles is under consideration.

### USCDI Treatment Data Content

The Report Treatment USCDI Data [RO-SMRT-09] transaction reports treatment data structured according to relevant USCDI data classes. Based on the SMRT USCDI investigation (USCDI Versions 1–5 and Draft v7; note that USCDI does not currently include mCODE data elements), the candidate data classes for radiation oncology are:

| USCDI Data Class | Data Element(s) | Use in SMRT |
|------------------|-----------------|-------------|
| Procedures | Medical Procedures Performed | Records the delivery of radiation treatments, coded with standard terminologies (e.g., CPT, SNOMED CT) for delivery methods such as IMRT, SBRT. |
| Encounter Information | Encounter Time / Encounter Type | Captures radiation oncology clinic appointments, simulation appointments, and daily treatment sessions. |
| Care Plan / Assessment | Assessment and Plan of Treatment | Captures the oncologist's overarching clinical logic and the prescribed course of radiation therapy. |
| Diagnostic Imaging | Diagnostic Imaging Test & Report | Captures CT simulation scans, PET scans, and MRIs used to contour targets and plan treatment. |
| Clinical Notes | Consultation Note, Procedure Note, Progress Note | Captures narrative treatment records, weekly on-treatment visit notes (OTVs), and the end-of-treatment summary. |
{: .grid}

The specific FHIR profiles and value sets for each data class are to be defined.
