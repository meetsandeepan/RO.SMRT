# 2:3.Y3 Report Treatment Approval [RO-SMRT-03] - Shared Management of Radiation Treatments v0.0.2-current

* [**Table of Contents**](toc.md)
* **2:3.Y3 Report Treatment Approval [RO-SMRT-03]**

## 2:3.Y3 Report Treatment Approval [RO-SMRT-03]

This section corresponds to transaction [RO-SMRT-03] of the IHE-RO Technical Framework. Transaction [RO-SMRT-03] is used by the ROIS to report the treatment approval to the TMS.

> **Editor's Note (provisional):** This transaction is in development. The transaction identifier and section number are provisional pending assignment by the IHE-RO Technical Committee. The FHIR message structure will be authored in a subsequent revision. See the [Open Issues](issues.md).

### Scope

This transaction is used by the ROIS, once a treatment has been approved for delivery, to communicate that approval to the TMS in a FHIR message. The ROIS serves as the gatekeeper for proceeding with treatment delivery; the TMS adds the approval to the plan.

### Actors Roles

**Table 2:3.Y3.2-1: Actor Roles**

| | | |
| :--- | :--- | :--- |
| Initiator | Sends the treatment approval | [ROIS](volume-1.md#radiation-oncology-information-system) |
| Responder | Receives the approval and adds it to plan | [TMS](volume-1.md#treatment-management-system) |

### Referenced Standards

* **FHIR-R4** [HL7 FHIR Release 4.0](http://hl7.org/fhir/R4/) — FHIR messaging

### Interactions

**Figure 2:3.Y3.4-1: Report Treatment Approval Interaction Diagram**


#### Report Treatment Approval Message

##### Trigger Events

The treatment is approved for delivery in the ROIS.

##### Message Semantics

**To be specified.** The FHIR message conveys the treatment approval.

##### Expected Actions

The Responder (TMS) records the approval and adds it to the plan, enabling treatment delivery to proceed.

### Security Considerations

See [SMRT Security Considerations](volume-1.md#security-considerations).

