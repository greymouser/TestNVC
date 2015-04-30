# TestNVC

 * ViewController class with {will,did}MovetoParentViewController overrides with logging info.
 * NavController class with delegate set to itself and {will,did}ShowViewController callbacks implemented.
 * Logging level can be set in `-[ViewController init]` with `#define`'s located there.

## Log Levels
### LOG_WILL_DID_MTPVC (0)

 * Logs all calls of `-[ViewController {will,did}MovetoParentViewController]`

### LOG_WILL_DID_MTPVC_LEAVING_AND_NVC_WILL_DID_SHOW_VC (1)

 * `-[ViewController {will,did}MovetoParentViewController]` when parent is nil (when the parent is telling the vc it is being removed)
 * `-[NavController.delegate {will,did}ShowViewController` logged (when vc is being pushed onto NVC)

## Tests

### Test environment

Simulator, iPhone 6, 8.3

### Test steps

 1. Set the log level
 2. Compile and run
 3. Push VC, push vc, pop vc, pop vc
 4. Collect logs

## Results

### LOG_WILL_DID_MTPVC

```
2015-04-30 08:49:12.137 TestNVC[39175:3477261] -[vc(rootVC) willMoveToParentViewController [entering]
2015-04-30 08:49:12.185 TestNVC[39175:3477261] -[vc(rootVC) didMoveToParentViewController [entering]
2015-04-30 08:49:16.081 TestNVC[39175:3477261] -[vc(1) willMoveToParentViewController [entering]
2015-04-30 08:49:16.586 TestNVC[39175:3477261] -[vc(rootVC) didMoveToParentViewController [entering]  # <-- this is odd
2015-04-30 08:49:16.586 TestNVC[39175:3477261] -[vc(1) didMoveToParentViewController [entering]
2015-04-30 08:49:19.881 TestNVC[39175:3477261] -[vc(2) willMoveToParentViewController [entering]
2015-04-30 08:49:20.386 TestNVC[39175:3477261] -[vc(2) didMoveToParentViewController [entering]
2015-04-30 08:49:21.345 TestNVC[39175:3477261] -[vc(2) willMoveToParentViewController [leaving]
2015-04-30 08:49:21.848 TestNVC[39175:3477261] -[vc(2) didMoveToParentViewController [leaving]
2015-04-30 08:49:22.293 TestNVC[39175:3477261] -[vc(1) willMoveToParentViewController [leaving]
2015-04-30 08:49:22.796 TestNVC[39175:3477261] -[vc(1) didMoveToParentViewController [leaving]
2015-04-30 08:49:22.796 TestNVC[39175:3477261] -[vc(rootVC) didMoveToParentViewController [entering]
```

The line marked as odd, certainly is odd to me.

### LOG_WILL_DID_MTPVC_LEAVING_AND_NVC_WILL_DID_SHOW_VC

```
2015-04-30 08:57:31.149 TestNVC[39283:3481141] -[nvcD willShowViewController]: rootVC
2015-04-30 08:57:31.191 TestNVC[39283:3481141] -[nvcD didShowViewController]: rootVC
2015-04-30 08:57:33.571 TestNVC[39283:3481141] -[nvcD willShowViewController]: 1
2015-04-30 08:57:34.077 TestNVC[39283:3481141] -[nvcD didShowViewController]: 1
2015-04-30 08:57:34.986 TestNVC[39283:3481141] -[nvcD willShowViewController]: 2
2015-04-30 08:57:35.490 TestNVC[39283:3481141] -[nvcD didShowViewController]: 2
2015-04-30 08:57:36.762 TestNVC[39283:3481141] -[vc(2) willMoveToParentViewController [leaving]
2015-04-30 08:57:36.763 TestNVC[39283:3481141] -[nvcD willShowViewController]: 1
2015-04-30 08:57:37.266 TestNVC[39283:3481141] -[vc(2) didMoveToParentViewController [leaving]
2015-04-30 08:57:37.266 TestNVC[39283:3481141] -[nvcD didShowViewController]: 1
2015-04-30 08:57:37.990 TestNVC[39283:3481141] -[vc(1) willMoveToParentViewController [leaving]
2015-04-30 08:57:37.991 TestNVC[39283:3481141] -[nvcD willShowViewController]: rootVC
2015-04-30 08:57:38.493 TestNVC[39283:3481141] -[vc(1) didMoveToParentViewController [leaving]
2015-04-30 08:57:38.493 TestNVC[39283:3481141] -[nvcD didShowViewController]: rootVC
```

This seems like what I want as VCs are pushed and popped from an NVC.
