This section corresponds to transaction [RO-YY] of the IHE-RO Technical Framework.

### Scope

This transaction is used to find Treatment Strategy objects that satisfy a set of paramaters.

### Actors Roles

The roles in this transaction are defined in the following table and may be played by the actors shown here:

<p id ="t3.YY.2-1" class="tableTitle"><strong>Table 2:3.YY.2-1: Actor Roles</strong></p>

| Role      | Description                               | Actor(s)          |
|-----------|-------------------------------------------|-------------------|
| Requester | Request Treatment Strategy objects that match a filter | [TMS](volume-1.html#treatment-management-system) |
| Responder | Return matching Treatment Strategy objects | [REPO](volume-1.html#ro-resource-repo) |
{: .grid}

### Referenced Standards

- **FHIR-R4** [HL7 FHIR Release 4.0]({{site.data.fhir.path}})
- **FHIR-R4 Search** [HL7 FHIR Search](https://www.hl7.org/fhir/search.html)

### Interactions

<figure>
{%include RO-SMRT-01-seq.svg%}
<figcaption><strong>Figure X.X.X.X-X:Query Treatment Strategy Interaction Diagram</strong></figcaption>
</figure>
<br clear="all"/>

#### Query Treatment Strategy ServiceRequests Message

The Requester needs to obtain high-level treatment strategy information from the Responder to proceed with detailed prescription and planning.

##### Trigger Events

When the user at a Requester starts working on a detailed prescription, the Requester issues a  

##### Message Semantics

The request message is a standard [FHIR Search]({{site.data.fhir.path}}search.html) request.
The Patient Demographics Consumer MAY use GET or POST based searches, and the Patient Demographics Supplier SHALL support both GET and POST based searches.
This operation can be invoked at the following path:

```
    [base]/ServiceRequest?<search>
```

> Note 1: The Requester MAY directly retrieve ServiceRequest resources using the [FHIR RESTful API Read](http://hl7.org/fhir/http.html#read) semantics if it knows about the corresponding resource ID.

###### Search Parameters

The Requester MAY supply, and the Responder SHALL be capable of processing all parameters listed below. All query parameter values SHALL be encoded per [RFC3986](https://tools.ietf.org/html/rfc3986) “percent” encoding rules. Note that percent encoding restrict the character set to a subset of ASCII characters. Certain ASCII characters used for URL syntax are not permitted in the query parameter value and need to be escaped.

The Requester SHALL be capable of providing the parameters attributes and query types as indicated by Requester Optionality 'R' in Table 
Table 2:3.YY.4.1.2.1-1 below.

The Responder SHALL support the parameters attributes and query types as indicated by Responder Optionality 'R' in Table 2:4.143.4.1.2.1-1 below.

**Table 2:3.YY.4.1.2.1-1: Query Treatment Strategy Search Parameters**

| Domain   | Commonly Known Attribute | Search Parameters <br> See Note 3 | Query Type <br> See Note 1, 2 and 4 | Requester Optionality | Responder Optionality |
|----------|-----------|-------------------|------------|-----------------------|-----------------------|
| Patient | Patient | `patient` | Reference(`Patient`) | R | R |
|         | Patient ID / MRN / Patient Identifier | `patient.identifier` | token | R | R |
|         | Patient Name | `patient.name.given` <br> `patient.name.family` | string | O | R |
| ServiceRequest | ServiceRequest | `basedOn` | Reference(`ServiceRequest`) | R | R |
|                | Accession Number | `basedOn.identifier` | token | R | R |
| Study | Study | `imagingStudy` | Reference(`ImagingStudy`) | O | R |
|       | Study Instance UID | `imagingStudy.identifier` | token | O | R |
|       | Modality | `imagingStudy.modality` | token | O | R |
|       | Study Date | `imagingStudy.started` | date | O | R |
| Report | Status | `status` | token | R | R |
| All | *Any other attributes* | *Other attributes in DiagnosticReport or referenced resources* | *varies* | O | O |
{: .grid}

> Note 1: See FHIR [http://hl7.org/fhir/search.html#reference](http://hl7.org/fhir/search.html#reference) for use of the reference search type.
>
> Note 2: See [ITI TF-2: Appendix Z.2](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.2-query-parameters) for additional constraints on the use of the token search parameter type.
>
> Note 3: See [FHIR Chaining Parameters](http://hl7.org/fhir/search.html#chaining) for search methodology on referenced resources. Not all Responder supports chaining parameters. In this case, a Requester can send multiple queries, search for the referenced resources first, then search for DiagnosticReport with the resources found.
>
> Note 4: See FHIR [http://hl7.org/fhir/search.html#date](http://hl7.org/fhir/search.html#date) for use of the date search type.

##### Expected Actions

The Responder SHALL process the query to discover the DiagnosticReport entries that match the search parameters given. 

The Responder SHALL support both GET and POST-based searches [http://hl7.org/fhir/http.html#search](http://hl7.org/fhir/http.html#search).

The Responder SHALL be capable of processing all query parameters according to Table 2:3.YY.4.1.2.1-1.

The Responder MAY choose to support additional query parameters. Any additional query parameters supported SHALL be supported according to the core FHIR specification. See [http://hl7.org/fhir/search.html#errors](http://hl7.org/fhir/search.html#errors).

The Responder SHALL support the following [Search results parameters](http://hl7.org/fhir/search.html):
- _include
- _sort
- _count
- _summary

The Responder MAY choose to support additional search results parameters.

###### Populating Expected Response Format

The FHIR standard provides encodings for responses as either XML or JSON. The Responder SHALL support both message encodings; the Requester SHALL support one and MAY support both.

See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for details.

#### Return ServiceRequests Bundle Message

The Responder sends matching entries back to the Requester.

##### Trigger Events

The Responder completed processing of the Query Treatment Strategy ServiceRequests message. 

##### Message Semantics

The message is an HTTP GET or HTTP POST response. 

The Responder returns an HTTP Status code appropriate to the processing as well as a Bundle of the matching `ServiceRequest` Resources.

The Responder MAY refuse or impose reasonable limits if a query is overly broad. The Responder MAY restrict results based on the authorization of the Requester, or based on other server implementation decisions.

Based on the query results, the Responder SHALL either return an error or success. Guidance on handling Access Denied related to use of 200, 403 and 404 can be found in [ITI TF-2: Appendix Z.7](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations). 

When the Responder needs to report an error, it SHALL use HTTP error response codes and SHOULD include a FHIR `OperationOutcome` with more details on the failure. See FHIR [http://hl7.org/fhir/http.html](http://hl7.org/fhir/http.html) and [http://hl7.org/fhir/operationoutcome.html](http://hl7.org/fhir/operationoutcome.html).

If the Query Treatment Strategy ServiceRequest message is processed successfully, whether or not any `ServiceRequest` Resources are found, the HTTP status code SHALL be 200. The Return ServiceRequest Bundle message SHALL be a `Bundle` Resource containing zero or more `ServiceRequest` Resources. If the Responder is sending warnings, the Bundle Resource SHALL also contain an `OperationOutcome` Resource that contains those warnings.

The Responder SHALL return the query results in the encoding (XML or JSON) specified by the Requester.

The response SHALL adhere to any FHIR `Bundle` constraints specified in [ITI TF-2: Appendix Z.1](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.1-resource-bundles).

The Responder SHALL return the full content of matching `ServiceRequest` resources in the returned bundle. The Responder MAY support additional search result parameters (e.g., _summary, _elements, _include, etc.) and return the modified results accordingly.

> Note: The `ServiceRequest` resources returned by the Responder may not conform to the IMR specification.

###### ServiceRequest Definition in the Context of Query Treatment Strategy Response

The ServiceRequest Resource(s) contained within the Query Treatment Strategy Response message SHOULD conform to [Radiotherapy Course Prescription Profile for CodeX RT](https://build.fhir.org/ig/HL7/codex-radiation-therapy/StructureDefinition-codexrt-radiotherapy-course-prescription.html).

###### Resource Bundling

Resource Bundling SHALL comply with the guidelines in [ITI TF-2: Appendix Z.1](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.1-resource-bundles). 

#### Expected Actions

If the Responder returns an HTTP redirect response (HTTP status codes 301, 302, 303, or 307), the Requester SHALL follow the redirect, but MAY stop processing if it detects a loop. See RFC7231 Section 6.4 Redirection 352.

The Requester SHALL process the results according to application-defined rules.

The Requester MAY show the attributes in the query response to the user.

### CapabilityStatement Resource

Requesters and Responders implementing this transaction SHALL provide a `CapabilityStatement` Resource as described in [ITI TF-2: Appendix Z.3](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.3-capabilitystatement-resource) indicating the transaction has been implemented. 

* Requirements CapabilityStatement for [TMS](CapabilityStatement-IHE.SMRT.tms.html)
* Requirements CapabilityStatement for [Server](CapabilityStatement-IHE.SMRT.rois.html)

### Security Considerations

See [SMRT Security Considerations](volume-1.html#security-considerations)

#### Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit

When grouped with ATNA Secure Application or Secure Node the Actor shall be able to record... 

''TODO: the specifics, leveraging BALP''

##### Server Audit

When grouped with ATNA Secure Application or Secure Node the Actor shall be able to record... 

''TODO: the specifics, leveraging BALP''
