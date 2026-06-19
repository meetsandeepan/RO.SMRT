This section corresponds to transaction [RO-SMRT-09] of the IHE-RO Technical Framework. Transaction [RO-SMRT-09] is used by the TMS to report treatment data aligned with the United States Core Data for Interoperability (USCDI) to the ROIS.

> **Editor's Note (provisional):** This transaction is in development. The transaction identifier and section number are provisional pending assignment by the IHE-RO Technical Committee. The reported data classes and FHIR content will be authored in a subsequent revision. See the [Open Issues](issues.html).

### Scope

This transaction is used by the TMS to report treatment-related data, structured according to the relevant USCDI data classes, to the ROIS. The candidate data classes (see [Volume 3](domain-ZZ.html)) include Procedures, Encounter Information, Care Plan / Assessment, Diagnostic Imaging, and Clinical Notes.

### Actors Roles

<p id ="t3.Y9.2-1" class="tableTitle"><strong>Table 2:3.Y9.2-1: Actor Roles</strong></p>

| Role      | Description                       | Actor(s)                                          |
|-----------|-----------------------------------|---------------------------------------------------|
| Initiator | Reports USCDI-aligned data        | [TMS](volume-1.html#treatment-management-system)  |
| Responder | Receives the reported data        | [ROIS](volume-1.html#radiation-oncology-information-system) |
{: .grid}

### Referenced Standards

- **FHIR-R4** [HL7 FHIR Release 4.0]({{site.data.fhir.path}})
- **USCDI** [United States Core Data for Interoperability](https://www.healthit.gov/isa/united-states-core-data-interoperability-uscdi)

### Interactions

<figure>
{%include RO-SMRT-09-seq.svg%}
<figcaption><strong>Figure 2:3.Y9.4-1: Report Treatment USCDI Data Interaction Diagram</strong></figcaption>
</figure>
<br clear="all"/>

#### Report Treatment USCDI Data Message

##### Trigger Events

Treatment data aligned with USCDI data classes becomes available at the TMS.

##### Message Semantics

*To be specified.* The content is expected to be structured according to the relevant USCDI data classes. See content definitions in [Volume 3](domain-ZZ.html).

##### Expected Actions

The Responder (ROIS) incorporates the reported data into the patient's authoritative treatment course record.

### Security Considerations

See [SMRT Security Considerations](volume-1.html#security-considerations).
