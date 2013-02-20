Aida
====

Port of Aida Web (http://www.aidaweb.si) to Cuis Smalltalk 4.1

Taken from Aida6.5-interim.2 from the repo http://www.smalltalkhub.com/#!/~Aida/Aida/versions/Aida6.5-interim.2

The 80 tests are green.

To install, evaluate:

    | slash  |
    slash := FileDirectory slash.
    {
    '..', slash, 'Cuis-Cryptography', slash, 'Cuis-System-Hashing.pck.st' .
    '..', slash, 'Cuis-CompatibilityWithOtherSmalltalks', slash, 'Cuis-CompatibilityWithOtherSmalltalks.pck.st' .
    '..', slash, 'Cuis-Pharo14CompatibilityLayer', slash, 'Cuis-Network-MIME.pck.st' .
    '..', slash, 'Cuis-Pharo14CompatibilityLayer', slash, 'Cuis-Network-UUID.pck.st' .
    '..', slash, 'Cuis-Pharo14CompatibilityLayer', slash, 'Cuis-NetworkTests-UUID.pck.st' .
    '..', slash, 'Cuis-Pharo14CompatibilityLayer', slash, 'Cuis-Network-Protocols.pck.st' .
    '..', slash, 'Cuis-Pharo14CompatibilityLayer', slash, 'Cuis-Network-Url.pck.st' .
    '..', slash, 'Cuis-Pharo14CompatibilityLayer', slash, 'Cuis-Network-RFC822.pck.st' .
    '..', slash, 'Cuis-Pharo14CompatibilityLayer', slash, 'Cuis-Settings-Network.pck.st' .
    '..', slash, 'Cuis-Pharo14CompatibilityLayer', slash, 'Cuis-NetworkTests-Protocols.pck.st' .
    '..', slash, 'Cuis-Pharo14CompatibilityLayer', slash, 'Cuis-NetworkTests-RFC822.pck.st' .
    '..', slash, 'Cuis-Sport', slash, 'Sport.pck.st' .
    '..', slash, 'Cuis-Swazoo', slash, 'Swazoo.pck.st' .
    '..', slash, 'Cuis-Aida', slash, 'Aida.pck.st' .
    }
    do:
    [ :fileName | CodePackageFile installPackageStream:
    (FileStream concreteStream readOnlyFileNamed: fileName)
    ].

Or alternatively download a ready to use image from http://www.arduinosoftware.com/cuis/CuisAida.zip

To install AidaToDoExample (http://www.aidaweb.si/todo-description) add in the previous installation script a line:

    '..', slash, 'Cuis-Aida', slash, 'AidaToDoExample.pck.st' .
   
CAUTION: You can not use the CuisAida.zip image because must grab the latest version of Aida to get AidaToDoExample working.
