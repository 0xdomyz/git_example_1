# Example play book

## Goal
Explain an example VCS workflow with example.
- The traditional folder stores artefacts of traditional workflow without VCS.
- Follow below to replay the changes under the an example VCS workflow, and understand how to use VCS to track changes and compare versions.

## Version 1
1. Simulate making changes by copying content of `traditional/version1_step1` to project root.
2. \[VCS\] In git gui, add all changes and make a commit, Push up the changes to remote.
3. Simulate making more changes by copying content of `traditional/version1_step2` to project root.
5. \[VCS\] Repeat step 3, go to the web interface, find this commit in the history, click it, note down the permalink to simulate sharing it.

## Version 2
1. Simulate making large changes by copying content of `traditional/version2` to project root.
2. \[VCS\] Repeat version 1 step 5.

## Activity
1. Use the web interface to test the permalink of the V1 commit, and make sure it shows the correct state.
2. Use the web interface to compare the changes between V1 and V2.