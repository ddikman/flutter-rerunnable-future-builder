# using the future loader

The future loader is an excellent way to easily handle the three render states of a an async operation:

1. Loading
2. Success
3. Failure

However, as this project shows, the flutter base `FutureBuilder` has an issue.

When trying to re-run the future, replacing it with a new one, we hit the issue that the snapshot state, `hasData` or `hasError` is not being reset.