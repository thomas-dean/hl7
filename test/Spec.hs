import Data.HL7

import Test.Framework
import Test.Framework.Providers.HUnit

import Test.HUnit

main = defaultMain [ 
  testGroup "Example Test Group" [ testCase "test case 1" test_case1
                                 , testCase "test case 2" test_case2
                                 ]
   ]

test_case1 = Message [] "some metadata" @?= Message [] "some metadata"
test_case2 = Message [ Field "some field"
                     , Components [ Component "some component"
                                  , Component "some other component"
                                  ] 
                     ] "some metadata" 
             @?= Message [ Field "some field"
                         , Components [ Component "some component"
                                      , Component "some other component"
                                      ] 
                         ] "some metadata" 

