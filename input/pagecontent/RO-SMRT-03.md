This section corresponds to transaction [RO-SMRT-03] of the IHE-RO Technical Framework. Transaction [RO-SMRT-03] is used by the TMS to retrieve a high-level prescription summary from the ROIS.

> **Editor's Note (provisional):** This transaction is in development and is associated with the [Support Prescription Option](volume-1.html#actor-options). The transaction identifier and section number are provisional pending assignment by the IHE-RO Technical Committee. Detailed message semantics will be authored in a subsequent revision. See the [Open Issues](issues.html).

### Scope

This transaction is used by the TMS to obtain a high-level prescription summary from the ROIS, supporting detailed prescription and planning on the device-specific system. It is used only when the actors support the Support Prescription Option.

### Actors Roles

<p id ="t3.Y3.2-1" class="tableTitle"><strong>Table 2:3.Y3.2-1: Actor Roles</strong></p>

| Role      | Description                                  | Actor(s)                                          |
|-----------|----------------------------------------------|---------------------------------------------------|
| Initiator | Requests the prescription summary            | [TMS](volume-1.html#treatment-management-system)  |
| Responder | Returns the prescription summary             | [ROIS](volume-1.html#radiation-oncology-information-system) |
{: .grid}

### Referenced Standards

- **FHIR-R4** [HL7 FHIR Release 4.0]({{site.data.fhir.path}})

### Interactions

<figure>
{%include RO-SMRT-03-seq.svg%}
<figcaption><strong>Figure 2:3.Y3.4-1: Retrieve Prescription Summary Interaction Diagram</strong></figcaption>
</figure>
<br clear="all"/>

#### Retrieve Prescription Summary Message

##### Trigger Events

The user at the TMS starts working on a detailed prescription or treatment plan and needs the high-level treatment strategy established in the ROIS.

##### Message Semantics

*To be specified.* The summary is expected to convey high-level treatment-strategy and prescription information. Alignment with the IHE-RO XRTS content is under consideration.

##### Expected Actions

The Responder (ROIS) returns the prescription summary for the identified patient and course of treatment.

### Security Considerations

See [SMRT Security Considerations](volume-1.html#security-considerations).
