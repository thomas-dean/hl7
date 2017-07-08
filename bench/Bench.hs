import Data.HL7

import Criterion.Main

main = defaultMain [
  bgroup "hl7" [ bench "test message 1" $ nf id test_message1
               , bench "test message 2" $ nf id test_message2
               ]
   ]

test_message1 = Message [] "some metadata"

test_message2 = Message [ Segment [ Field "some field"
                                  , Components [ Component "some component"
                                               , Component "some other component"
                                               ] 
                                  ] "MSH"
                        ] "some metadata" 
