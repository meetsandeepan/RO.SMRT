This section corresponds to transaction [RO-SMRT-06] of the IHE-RO Technical Framework. Transaction [RO-SMRT-06] is used to report a patient check-in between the ROIS and the TMS.

> **Editor's Note (provisional):** This transaction is in development. The transaction identifier and section number are provisional pending assignment by the IHE-RO Technical Committee. Detailed message semantics will be authored in a subsequent revision. See the [Open Issues](issues.html).

### Scope

This transaction is used when a patient is checked-in for a scheduled appointment — either at the ROIS or at the TMS — so that the ROIS or the TMS notifies the other that the treatment session is ready to be managed by the TMS.

### Actors Roles

<p id ="t3.Y6.2-1" class="tableTitle"><strong>Table 2:3.Y6.2-1: Actor Roles</strong></p>

| Role      | Description                                        | Actor(s)                                          |
|-----------|----------------------------------------------------|---------------------------------------------------|
| Initiator | Reports that the patient has been checked-in       | [ROIS](volume-1.html#radiation-oncology-information-system) or [TMS](volume-1.html#treatment-management-system) |
| Responder | Receives the check-in notification                 | [TMS](volume-1.html#treatment-management-system) or [ROIS](volume-1.html#radiation-oncology-information-system) |
{: .grid}

### Referenced Standards

- **FHIR-R4** [HL7 FHIR Release 4.0]({{site.data.fhir.path}})
- **HL7 V2** scheduling (SIU) messaging — *to be confirmed in a subsequent revision*

### Interactions

<figure>
{%include RO-SMRT-06-seq.svg%}
<figcaption><strong>Figure 2:3.Y6.4-1: Report Patient Check-in Interaction Diagram</strong></figcaption>
</figure>
<br clear="all"/>

#### Report Patient Check-in Message

##### Trigger Events

A patient is checked-in for a scheduled appointment at the ROIS or at the TMS.

##### Message Semantics

*To be specified.* The message conveys that the patient has been checked-in and the treatment session is ready to be managed by the TMS.

##### Expected Actions

The Responder is informed that the treatment session is ready to be managed by the TMS.

### Security Considerations

See [SMRT Security Considerations](volume-1.html#security-considerations).
