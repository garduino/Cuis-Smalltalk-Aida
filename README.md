Aida
====

*** This is only an early first filein of the Aida original code into Cuis 4.1 ***

Port of Aida Web (http://www.aidaweb.si) to Cuis Smalltalk 4.1

Taken from Aida6.5-interim.2 from the repo http://www.smalltalkhub.com/#!/~Aida/Aida/versions/Aida6.5-interim.2


LibAida-Libraries is no longer useful, I used it while porting, to avoid save the big size of data here.

To install, evaluate:

    | slash  |
    slash := FileDirectory slash.
    {
    '..', slash, 'Cuis-Cryptography', slash, 'Cuis-System-Hashing.pck.st' .
    '..', slash, 'Cuis-CompatibilityWithOtherSmalltalks', slash, 'Cuis-CompatibilityWithOtherSmalltalks.pck.st' .
    '..', slash, 'Cuis-Pharo14CompatibilityLayer', slash, 'Cuis-Network-Protocols.pck.st' .
    '..', slash, 'Cuis-Pharo14CompatibilityLayer', slash, 'Cuis-Network-Url.pck.st' .
    '..', slash, 'Cuis-Sport', slash, 'Sport.pck.st' .
    '..', slash, 'Cuis-Swazoo', slash, 'Swazoo.pck.st' .
    '..', slash, 'Cuis-Swazoo', slash, 'Swazoo.pck.st' .
    }
    do:
    [ :fileName | CodePackageFile installPackageStream:
        (FileStream concreteStream readOnlyFileNamed: fileName)
    ].


