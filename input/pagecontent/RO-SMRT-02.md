This section corresponds to transaction [RO-SMRT-02] of the IHE-RO Technical Framework. Transaction [RO-SMRT-02] is used by the ROIS to synchronize treatment appointments with the TMS.

> **Editor's Note (provisional):** This transaction is in development. The transaction identifier and section number are provisional pending assignment by the IHE-RO Technical Committee. Detailed message semantics will be authored in a subsequent revision. See the [Open Issues](issues.html).

### Scope

This transaction is used by the ROIS to send the appointments scheduled for the treatment fractions to the TMS, and to notify the TMS of subsequent appointment changes or cancellations, so that the TMS can prepare to manage the corresponding treatment sessions.

### Actors Roles

<p id ="t3.Y2.2-1" class="tableTitle"><strong>Table 2:3.Y2.2-1: Actor Roles</strong></p>

| Role      | Description                                          | Actor(s)                                          |
|-----------|------------------------------------------------------|---------------------------------------------------|
| Initiator | Sends scheduled appointments and notifies of changes | [ROIS](volume-1.html#radiation-oncology-information-system) |
| Responder | Receives and applies appointment information         | [TMS](volume-1.html#treatment-management-system)  |
{: .grid}

### Referenced Standards

- **FHIR-R4** [HL7 FHIR Release 4.0]({{site.data.fhir.path}})
- **HL7 V2** scheduling (SIU) messaging — *to be confirmed in a subsequent revision*

### Interactions

<figure>
{%include RO-SMRT-02-seq.svg%}
<figcaption><strong>Figure 2:3.Y2.4-1: Sync Treatment Appointment Interaction Diagram</strong></figcaption>
</figure>
<br clear="all"/>

#### Sync Treatment Appointment Message

##### Trigger Events

A series of appointments is scheduled for the treatment fractions in the ROIS, or an existing appointment is modified or cancelled.

##### Message Semantics

*To be specified.* The message conveys the scheduled treatment-fraction appointments.

##### Expected Actions

The Responder (TMS) applies the received appointments and reflects subsequent updates and cancellations so that its local schedule remains synchronized with the ROIS.

### Security Considerations

See [SMRT Security Considerations](volume-1.html#security-considerations).
