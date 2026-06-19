This section corresponds to transaction [RO-SMRT-01] of the IHE-RO Technical Framework. Transaction [RO-SMRT-01] is used by the ROIS and the TMS to synchronize patient demographic information.

> **Editor's Note (provisional):** This transaction is in development. The transaction identifier and section number are provisional pending assignment by the IHE-RO Technical Committee. Detailed message semantics (including the use of HL7v2 ADT and/or FHIR messaging, and the patient photo by-value/by-reference handling) will be authored in a subsequent revision. See the [Open Issues](issues.html).

### Scope

This transaction is used by the ROIS to send patient demographic information — including patient encounter information and the patient photo — to the TMS, and to notify the TMS of subsequent demographic or patient-identifier changes, so that the TMS can prepare for and manage the treatment workflow for that patient.

### Actors Roles

The roles in this transaction are defined in the following table and may be played by the actors shown here:

<p id ="t3.Y1.2-1" class="tableTitle"><strong>Table 2:3.Y1.2-1: Actor Roles</strong></p>

| Role      | Description                                              | Actor(s)                                          |
|-----------|---------------------------------------------------------|---------------------------------------------------|
| Initiator | Sends patient demographics and notifies of changes      | [ROIS](volume-1.html#radiation-oncology-information-system) |
| Responder | Receives and applies patient demographics               | [TMS](volume-1.html#treatment-management-system)  |
{: .grid}

### Referenced Standards

- **FHIR-R4** [HL7 FHIR Release 4.0]({{site.data.fhir.path}})
- **HL7 V2** patient administration (ADT) messaging — *to be confirmed in a subsequent revision*

### Interactions

<figure>
{%include RO-SMRT-01-seq.svg%}
<figcaption><strong>Figure 2:3.Y1.4-1: Sync Patient Demographics Interaction Diagram</strong></figcaption>
</figure>
<br clear="all"/>

#### Sync Patient Demographics Message

The ROIS sends patient demographic information to the TMS.

##### Trigger Events

A patient is registered in the ROIS, or the patient demographics, patient encounter, patient photo, or patient identifier are subsequently modified in the ROIS.

##### Message Semantics

*To be specified.* The message conveys patient demographics, patient encounter information, and the patient photo (either by value, or by reference for subsequent retrieval from the ROIS).

##### Expected Actions

The Responder (TMS) applies the received demographics, encounter information, and photo, and reflects subsequent updates — including patient-identifier changes — so that its local record remains synchronized with the ROIS.

### Security Considerations

See [SMRT Security Considerations](volume-1.html#security-considerations).
