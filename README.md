# [A]lready [B]een [C]ompromised

                                       
Script to check a list of passwords against haveibeenpwned.com/Passwords without sharing the full sha1 to the api.
Code reuse from https://medium.com/@monliclican/bash-one-liner-to-check-your-password-s-via-pwnedpasswords-coms-api-using-the-k-anonymity-method-a5807a9a8056

Example: cat passwords | ./abc.sh

Ouput: 
Hash prefix: 5baa6 Hash suffix: 1e4c9b93f3f0682250b6cf8331b7ee68fd8 Your password appeared 3533661 times in the database.
