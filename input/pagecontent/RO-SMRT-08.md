This section corresponds to transaction [RO-SMRT-08] of the IHE-RO Technical Framework. Transaction [RO-SMRT-08] is used to exchange image approval information between the TMS and the ROIS.

> **Editor's Note (provisional):** This transaction is in development. The transaction identifier and section number are provisional pending assignment by the IHE-RO Technical Committee. The FHIR message structure will be authored in a subsequent revision. See the [Open Issues](issues.html).

### Scope

This transaction is used to convey image approval information. When image approval is performed at the TMS, the TMS reports the approval to the ROIS. (When image approval is performed at the ROIS, no exchange is required.)

### Actors Roles

<p id ="t3.Y8.2-1" class="tableTitle"><strong>Table 2:3.Y8.2-1: Actor Roles</strong></p>

| Role      | Description                          | Actor(s)                                          |
|-----------|--------------------------------------|---------------------------------------------------|
| Initiator | Reports the image approval           | [TMS](volume-1.html#treatment-management-system)  |
| Responder | Receives the image approval          | [ROIS](volume-1.html#radiation-oncology-information-system) |
{: .grid}

### Referenced Standards

- **FHIR-R4** [HL7 FHIR Release 4.0]({{site.data.fhir.path}}) — FHIR messaging

### Interactions

<figure>
{%include RO-SMRT-08-seq.svg%}
<figcaption><strong>Figure 2:3.Y8.4-1: Image Approval Interaction Diagram</strong></figcaption>
</figure>
<br clear="all"/>

#### Image Approval Message

##### Trigger Events

An image is approved at the TMS.

##### Message Semantics

*To be specified.* The FHIR message conveys the image approval and references the relevant image.

##### Expected Actions

The Responder (ROIS) records the image approval as part of the patient's treatment course record.

### Security Considerations

See [SMRT Security Considerations](volume-1.html#security-considerations).
