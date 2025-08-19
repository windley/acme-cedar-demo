# ACME Cedar Example

This repository contains the Cedar schema, policies, and entity definitions used in the ACME **Customer Collaboration platform** scenario from the book *Authorization in Digital Identity*. The example demonstrates how a fictional company, ACME Corp, uses Cedar to model fine-grained access control for employees and customers collaborating on shared documents.

The files in this repo show how to define a schema for employees, customers, teams, and documents; how to write policies for ownership baselines, customer viewing, delegatable sharing, and global constraints; and how to represent entities in JSON for evaluation. Together, these pieces illustrate how Cedar supports a mix of RBAC, ABAC, ReBAC, and discretionary permissions in a unified way.

These examples are designed to accompany the chapters on **Implementing Policies with Cedar** and the appendix with an **end-to-end walkthrough**. Readers are encouraged to use the repository as a reference or starting point for experimenting with Cedar, Amazon Verified Permissions, or the Cedar Local Agent in their own projects.

## Quick Start

1. Make sure you have the AWS CLI installed and configured.  
2. Upload the schema and policies to an Amazon Verified Permissions (AVP) policy store.  
3. Use the included `acme-entities.json` file as the entity definitions for your requests.  
4. Try evaluating a simple authorization request. For example, to check if **Alice** (an ACME employee) can view the **Q3 plan** document:

   ```bash
   aws verifiedpermissions is-authorized \
     --policy-store-id "$STORE_ID" \
     --principal entityType=ACME::Employee,entityId=alice \
     --action actionType=ACME::Action,actionId=doc:view \
     --resource entityType=ACME::Document,entityId=q3-plan \
     --entities file://acme-entities.json
     
The response will indicate whether the request is ALLOW or DENY, based on the Cedar policies and entity relationships defined in this repo.
