
In contemporary radiation oncology clinics, a single Radiation Oncology Information System (ROIS) is deployed to manage the electronic medical records (EMR) for all patients. This centralized system is used by radiation oncologists and departmental staff to prescribe, schedule, and track the complete course of treatment for each patient.

For an optimal workflow, all treatment devices should be interfaced with the ROIS to enable scheduling, prescription management, and treatment progress monitoring to be performed directly within that single, centralized system.

While some treatment devices can be managed by a Treatment Management System (TMS) integrated with the ROIS via the IHE-RO TDW-II profile, many others interface exclusively with a device-specific TMS or contain an integrated TMS. This is increasingly common with the emergence of treatment devices for novel techniques like Online Adaptive Radiation Therapy (OART), which utilizes imaging such as CBCT, CT, or MRI, and PET-based Dose-Guided Radiation Therapy (DGRT), which often bundle the TMS, Treatment Planning System (TPS), and Treatment Delivery Device (TDD) actors.

These standalone treatment devices are frequently disconnected from the departmental ROIS, creating isolated "islands" where treatments must be scheduled and tracked separately. This forces staff to rely on inefficient and error-prone workarounds, such as manual data entry or ad-hoc software bridges. Integrating these devices into the main ROIS is therefore essential to provide the same unified scheduling, review, and tracking capabilities available for the standard treatment device fleet.

The SMRT Profile provides the necessary mechanisms for exchanging scheduling, planning, and treatment delivery artifacts to support these scenarios, thereby enabling a holistic and unified view of all ongoing treatments within the ROIS.

This profile is a **Workflow and Content** profile. See the IHE Technical Frameworks [General Introduction](https://profiles.ihe.net/GeneralIntro/) for definitions of these profile types.

<a name="actors-and-transactions"> </a>

## 1:X.1 SMRT Actors, Transactions, and Content Modules

This section defines the actors, transactions, and/or content modules in this profile. General
definitions of actors are given in the Technical Frameworks General Introduction [Appendix A](https://profiles.ihe.net/GeneralIntro/ch-A.html).
IHE Transactions can be found in the Technical Frameworks General Introduction [Appendix B](https://profiles.ihe.net/GeneralIntro/ch-B.html).
Both appendices are located at <https://profiles.ihe.net/GeneralIntro/>.

The figure below shows the actors directly involved in the SMRT Profile and the relevant transactions between them. Other actors that may be indirectly involved due to their participation in other related profiles (the Hospital Information System and an object store used for DICOM retrieval) are shown for context.

<figure>
{% include ActorsAndTransactions.svg max-width="200px" %}
<figcaption><strong>Figure X.1-1: SMRT Actor Diagram</strong></figcaption>
</figure>
<br clear="all"/>

<p id ="tXX.1-1" class="tableTitle"><strong>Table X.1-1: SMRT Profile - Actors and Transactions</strong></p>

| Actors  | Transactions                                | Initiator or Responder | Optionality      | Reference          |
|---------|---------------------------------------------|------------------------|------------------|--------------------|
| ROIS    | Sync Patient Demographics [RO-SMRT-01]      | Initiator              | R                | RO TF-2: 3.Y1      |
|         | Sync Treatment Appointment [RO-SMRT-02]     | Initiator              | R                | RO TF-2: 3.Y2      |
|         | Retrieve Prescription Summary [RO-SMRT-03]  | Responder              | O (Note 1)       | RO TF-2: 3.Y3      |
|         | Report Planning Artifacts [RO-SMRT-04]      | Responder              | R                | RO TF-2: 3.Y4      |
|         | Report Treatment Approval [RO-SMRT-05]      | Initiator              | R                | RO TF-2: 3.Y5      |
|         | Report Patient Check-in [RO-SMRT-06]        | Initiator/Responder    | R                | RO TF-2: 3.Y6      |
|         | Report Treatment Artifacts [RO-SMRT-07]     | Responder              | R                | RO TF-2: 3.Y7      |
|         | Image Approval [RO-SMRT-08]                 | Responder              | O                | RO TF-2: 3.Y8      |
|         | Report Treatment USCDI Data [RO-SMRT-09]    | Responder              | O                | RO TF-2: 3.Y9      |
| TMS     | Sync Patient Demographics [RO-SMRT-01]      | Responder              | R                | RO TF-2: 3.Y1      |
|         | Sync Treatment Appointment [RO-SMRT-02]     | Responder              | R                | RO TF-2: 3.Y2      |
|         | Retrieve Prescription Summary [RO-SMRT-03]  | Initiator              | O (Note 1)       | RO TF-2: 3.Y3      |
|         | Report Planning Artifacts [RO-SMRT-04]      | Initiator              | R                | RO TF-2: 3.Y4      |
|         | Report Treatment Approval [RO-SMRT-05]      | Responder              | R                | RO TF-2: 3.Y5      |
|         | Report Patient Check-in [RO-SMRT-06]        | Initiator/Responder    | R                | RO TF-2: 3.Y6      |
|         | Report Treatment Artifacts [RO-SMRT-07]     | Initiator              | R                | RO TF-2: 3.Y7      |
|         | Image Approval [RO-SMRT-08]                 | Initiator              | O                | RO TF-2: 3.Y8      |
|         | Report Treatment USCDI Data [RO-SMRT-09]    | Initiator              | O                | RO TF-2: 3.Y9      |
{: .grid}

Note 1: *Retrieve Prescription Summary [RO-SMRT-03] is required only when the actor supports the [Support Prescription Option](#actor-options).*

> **Editor's Note (provisional):** The transaction names, identifiers (RO-SMRT-0x), and section references in Table X.1-1 are provisional. Final transaction numbers are assigned by the IHE-RO Technical Committee. This table is derived from the SMRT transaction assignment worksheet and the SMRT sequence diagram (Phase 1 / MVP scope). Several transactions are carried over established standards (HL7v2 ADT/SIU for synchronization, DICOM for artifact retrieval); see the transaction descriptions and the [Open Issues](issues.html).

### X.1.1 Actors

The actors in this profile are described in more detail in the sections below.

<a name="radiation-oncology-information-system"> </a>

#### X.1.1.1 Radiation Oncology Information System (ROIS)

The Radiation Oncology Information System (ROIS) is the single, centralized departmental system that manages the electronic medical record for all patients and maintains the authoritative record of each patient's treatment course. In this profile the ROIS is responsible for:

- **Patient and Schedule Management** — synchronizing patient demographics and appointment information with the TMS to prepare it for the treatment workflow.
- **Treatment Approval** — serving as the system where clinical approval for treatment is given and communicating that authorization to the TMS, acting as the gatekeeper for proceeding with treatment delivery.
- **Artifact Consolidation and Oversight** — providing a centralized point of access to treatment-related artifacts; receiving notifications from the TMS when planning and treatment delivery artifacts are available, selectively retrieving them as needed for clinical review and progress tracking, and optionally serving as the long-term archive for retrieved data.

Requirements CapabilityStatement for [ROIS](CapabilityStatement-IHE.SMRT.rois.html).

<a name="treatment-management-system"> </a>

#### X.1.1.2 Treatment Management System (TMS)

The Treatment Management System (TMS) is a device-specific subsystem for treatment execution. It coordinates the treatment planning activities and the detailed management of the delivery of treatment sessions on its associated device(s). It reports the status and results of these activities back to the ROIS, thereby contributing to the patient's authoritative treatment course record. A TMS may be a standalone system or may be integrated with (or embedded in) a treatment device that also bundles the Treatment Planning System (TPS) and Treatment Delivery Device (TDD).

Requirements CapabilityStatement for [TMS](CapabilityStatement-IHE.SMRT.tms.html).

### X.1.2 Transaction Descriptions

The transactions in this profile are summarized below. Detailed transaction definitions appear in Volume 2.

- **Sync Patient Demographics [RO-SMRT-01]** — the ROIS sends patient demographic information (and patient encounter and patient photo information) to the TMS, and notifies the TMS of subsequent demographic or patient-identifier changes.
- **Sync Treatment Appointment [RO-SMRT-02]** — the ROIS sends the scheduled treatment-fraction appointments to the TMS and notifies it of subsequent changes.
- **Retrieve Prescription Summary [RO-SMRT-03]** — the TMS retrieves a high-level prescription summary from the ROIS (used only with the Support Prescription Option).
- **Report Planning Artifacts [RO-SMRT-04]** — the TMS notifies the ROIS that treatment planning artifacts (e.g., RT Plan) are ready for retrieval; the ROIS may then retrieve them.
- **Report Treatment Approval [RO-SMRT-05]** — the ROIS sends the treatment-plan approval to the TMS, authorizing delivery.
- **Report Patient Check-in [RO-SMRT-06]** — the ROIS or the TMS notifies the other that a checked-in treatment session is ready to be managed by the TMS.
- **Report Treatment Artifacts [RO-SMRT-07]** — when a treatment session is complete or canceled, the TMS notifies the ROIS that treatment artifacts (e.g., RT Record) are ready for retrieval.
- **Image Approval [RO-SMRT-08]** — image approval information is exchanged between the TMS and the ROIS.
- **Report Treatment USCDI Data [RO-SMRT-09]** — the TMS reports treatment data aligned with the United States Core Data for Interoperability (USCDI) to the ROIS.

> The Report Planning Artifacts and Report Treatment Artifacts transactions convey notifications via FHIR messages that reference DICOM RT objects. The actual artifacts (e.g., RT Plan, RT Record, images) are retrieved by the ROIS from an object store using established DICOM transactions (C-MOVE/C-GET/QIDO-RS/WADO-RS). Patient and appointment synchronization may be carried over HL7v2 (ADT/SIU). The precise messaging for each transaction is specified in Volume 2.

<a name="actor-options"> </a>

## X.2 SMRT Actor Options

Options that may be selected for each actor in this profile are listed in Table X.2-1 below. Dependencies
between options when applicable are specified in notes.

<p id ="tXX.2-1" class="tableTitle"><strong>Table X.2-1: SMRT - Actors and Options</strong></p>

| Actor | Option Name                  | Reference   |
|-------|------------------------------|-------------|
| ROIS  | Support Prescription Option  | Section X.2.1 |
| TMS   | Support Prescription Option  | Section X.2.1 |
{: .grid}

### X.2.1 Support Prescription Option

The Support Prescription Option enables the direct exchange of high-level prescription information between the ROIS and the TMS, beyond the minimum demographics, scheduling, and artifact-reporting workflow. An actor that supports this option shall support the Retrieve Prescription Summary [RO-SMRT-03] transaction (the ROIS as Responder, the TMS as Initiator).

<a name="required-groupings"> </a>

## X.3 SMRT Required Actor Groupings

An actor from this profile (Column 1) shall implement all of the required transactions and/or content modules in this profile ***in addition to*** all of the requirements for the grouped actor (Column 2).

The actors in this profile exchange protected health information and therefore require the security and time groupings common to IHE profiles. The SMRT Technical Committee will confirm the final set of required groupings during ballot; the groupings below are the expected baseline.

<p id ="tXX.3-1" class="tableTitle"><strong>Table X.3-1: SMRT - Required Actor Groupings</strong></p>

| SMRT Actor | Grouping Condition | Actor(s) to be grouped with | Reference |
|------------|--------------------|-----------------------------|-----------|
| ROIS | Required | ITI CT / Time Client | ITI TF-1: 7 |
| ROIS | Required | ITI ATNA / Secure Node or Secure Application | ITI TF-1: 9 |
| TMS  | Required | ITI CT / Time Client | ITI TF-1: 7 |
| TMS  | Required | ITI ATNA / Secure Node or Secure Application | ITI TF-1: 9 |
{: .grid}

> **Editor's Note (provisional):** Required groupings are under review by the IHE-RO Technical Committee. See [Open Issues](issues.html).

<a name="overview"> </a>

## X.4 SMRT Overview

This section shows how the transactions and content modules of the profile are combined to address the use cases. Use cases are informative, not normative, and "SHALL" language is not allowed in use cases.

### X.4.1 Concepts

The SMRT Profile addresses the integration of "island" treatment devices — devices that are managed by a device-specific or embedded Treatment Management System (TMS) and that are not otherwise connected to the departmental Radiation Oncology Information System (ROIS). The profile defines the minimum exchanges needed for the ROIS to schedule, review, and track treatments performed on such devices as if they were part of the standard treatment device fleet.

### X.4.2 Use Cases

#### X.4.2.1 Use Case #1: Shared Management of Treatment

This use case describes how clinical staff can use a single departmental Radiation Oncology Information System (ROIS) to schedule, review, and track the treatment progress of a therapy session conducted on a standalone treatment device.

##### X.4.2.1.1 Shared Management of Treatment Use Case Description

This use case defines the minimum set of transactions required to establish a clinically acceptable integration workflow between a standalone treatment device and a departmental ROIS. This baseline workflow focuses on the exchange of patient demographics, scheduling, and treatment-related artifacts. More advanced interactions, such as the direct exchange of prescription information, are considered optional extensions.

The departmental ROIS is responsible for managing the patient's clinical journey and maintaining the authoritative record of the patient's treatment course. Its core responsibilities, as defined by this profile, are:

- **Patient and Schedule Management:** It synchronizes patient demographics and appointment information with the TMS to prepare it for the treatment workflow.
- **Treatment Approval:** It is the system where clinical approval for treatment is given. It communicates this authorization to the TMS, serving as the gatekeeper for proceeding with treatment delivery.
- **Artifact Consolidation and Oversight:** It provides a centralized point of access to all treatment-related artifacts. It receives notifications from the TMS when planning and treatment delivery artifacts are available, and it may selectively retrieve them as needed to provide a holistic view for clinical review and progress tracking and, optionally, serve as the long-term archive for all retrieved data.

Each device-specific TMS functions as a specialized subsystem for treatment execution. It is responsible for coordinating the treatment planning activities and for detailed management of the delivery of the treatment sessions on its associated device(s). It reports the status and results of these activities back to the ROIS, thereby contributing to the patient's authoritative treatment course record.

##### X.4.2.1.2 Shared Management of Treatment Process Flow

The process flow for this use case is initiated by the departmental ROIS, which is the central point of management for the patient's entire treatment journey.

<figure>
{% include usecase1-processflow.svg %}
<figcaption><strong>Figure X.4.2.1.2-1: Basic Process Flow in SMRT Profile</strong></figcaption>
</figure>
<br clear="all"/>

**Pre-conditions:** A patient has been registered in the Hospital Information System (HIS) and the departmental ROIS, and a standalone treatment device managed by a TMS is available for the patient's treatment.

**Main Flow:**

*Patient Registration:*

- When a patient is registered in the ROIS, the ROIS sends the patient demographics to the TMS.
- The ROIS sends the patient encounter information to the TMS.
- The ROIS sends the patient photo to the TMS either by value in a FHIR message, or by reference in a FHIR message for subsequent retrieval from the ROIS.
- When a series of appointments are scheduled for the treatment fractions in the ROIS, the ROIS sends all scheduled appointments to the TMS.
- At any point during the workflow:
  - if the patient demographics or appointments are modified, the ROIS updates the demographics or appointments in the TMS;
  - if the patient identifier is changed, the ROIS notifies the TMS of the change.

*Treatment Planning:*

- When a plan is imported and approved in the TMS, the plan is enriched in the TMS.
- The TMS sends, to the ROIS, information about all treatment planning artifacts which are ready for retrieval.
- The ROIS retrieves the artifacts (e.g., RT Plan) which are required for treatment progress tracking.

*Treatment Approval:*

- When the plan is approved for delivery in the ROIS, the ROIS sends the approval to the TMS.
- The TMS adds the approval to the plan.
- The TMS then sends, to the ROIS, information about all treatment delivery artifacts which are ready for retrieval.
- The ROIS retrieves the artifacts (e.g., RT Plan) which are required for treatment progress tracking.

*Treatment Delivery:*

- When a patient is checked-in for a scheduled appointment, either at the ROIS or at the TMS, the ROIS or the TMS notifies the other that treatment session delivery is ready to be managed by the TMS.
- When the treatment session is complete or canceled, the TMS sends, to the ROIS, information about all treatment artifacts which are ready for retrieval.
- The ROIS retrieves the artifacts (e.g., RT Record) which are required for treatment progress tracking.

**Post-conditions:** The ROIS holds (or can retrieve) the planning and treatment-delivery artifacts for the session, enabling unified scheduling, review, and progress tracking of the standalone device alongside the rest of the treatment device fleet.

<a name="security-considerations"> </a>

## X.5 SMRT Security Considerations

The SMRT Profile exchanges protected health information (patient demographics, photos, schedules, prescriptions, planning and treatment-delivery artifacts) between the ROIS and the TMS. A formal risk assessment will be performed by the IHE-RO Technical Committee; the considerations below summarize the expected baseline.

- **Confidentiality and integrity in transit:** transactions should be carried over secure, mutually authenticated channels. Actors are expected to be grouped with ATNA Secure Node or Secure Application (see [Required Groupings](#required-groupings)).
- **Consistent time:** actors are expected to be grouped with a Consistent Time (CT) Client so that audit records and treatment timelines are correlated across systems.
- **Audit logging:** security-relevant events (artifact reporting, retrieval, approval, demographic updates) should be recorded as audit events; profiling of audit messages leverages the Basic Audit Log Patterns (BALP) content this IG depends on.
- **Authorization:** Responders may restrict results based on the authorization of the Initiator.

This section will be expanded with the threat model, mitigations, and residual risks. See [Open Issues](issues.html).

<a name="other-grouping"> </a>

## X.6 SMRT Cross-Profile Considerations

This section is informative.

**IHE-RO TDW-II (Treatment Delivery Workflow II)** — A TMS integrated with the ROIS via TDW-II is managed through that profile. SMRT addresses the complementary case of standalone, device-specific or embedded TMSs that are not connected through TDW-II, allowing them to participate in unified departmental scheduling, review, and tracking.

**IHE-RO XRTS (Cross-Enterprise RT Summary)** — The treatment summary and prescription content exchanged in the broader clinic workflow (including with the Hospital Information System) relates to the artifacts consolidated by the ROIS in this profile.

**DICOM / RT objects** — The planning and treatment artifacts referenced by SMRT FHIR messages (RT Plan, RT Record, images, structure sets, dose) are DICOM RT objects retrieved from an object store using established DICOM transactions.
