@preregistered_results is a twitter bot that helps make https://www.kalzumeus.com/essays/dropping-hashes/ a bit more accessible to "the layperson".

As evidence that this might have worked, I pre-registered these results publically on:

https://twitter.com/TransposedL/status/1318049374308503554

I am now tweeting a hash of this document on my personal account, @josh_works.

I think I can make something interesting happen. 

I'm going to hash this document and tweet it from my twitter account in a few minutes.

Then, I'll try to figure out how to do something interesting with it.

Possible ideas:

- A web app that can take a document and tweet a md5sum of it, like "pre-registered-results.com"
- a web app that takes raw text, and md5sums it, and you can give it an md5sum and it'll verify if they match
- a twitter bot that can read a tweet, and do some processing of it, and say something like: "So-and-so preregistered a result on so-and-so day" and perhaps have a mechanism by which that person can prove validity of a document at a later date.
- It would be cool if it could "show up in the comments" like threader app in twitter, or some of the bots on reddit, like one that says "looks like you didn't make that a URL, here it is as a link:"
- Makes me think an API that I could hit (first w/foreman) and later with a front-end (maybe) or one that will take API requests and return a status, like `POST /pre-register/` and it would take params like: `md5sum` or `payload | encryption type` (so you could specify `sha256 {document}` or `md5sum {document}`) and it would return some message. 

`post {sha256}`

I'll start with basically building an app that runs
```
shasum -a 512 name-of-the-file.txt
```

and outputs something like:

> shasum -a 512 dropping-hashes.md


## About

Here's the key piece:

> All people professionally relevant to you will understand that they are certain, to far beyond the threshold they would need to bet their life savings on the matter, that you had the document as of the publication of the hash.

Here's the above quote in context:

> ### One application of cryptographically secure hashes
> 
> The computer security field abuts cryptography, and makes use of it for extremely important uses (such as securing most communication over the Internet) and less important uses, such as claiming credit for knowing things before they were widely known.
> 
> In computer security, sometimes one can produce dangerous information. Perhaps one could discover, through application of one’s professional skillset, that it is possible to break into Google. To publish that information incurs a risk of enabling someone to do a very bad thing. Many researchers would choose to inform Google privately of their results.
> 
> This is not optimal from a professional incentive standpoint, because it is a very professionally significant event to have discovered how to break into Google. This is an achievement in the same way that a scientific paper with an important novel result is an achievement. It could result in lucrative job offers, consulting contracts, or Hacker News karma.
> 
> If you let Google fix the issue, you might not be able to credibly say “Prior to Google telling the world about the issue they fixed, I knew about it, because I did the research that uncovered this problem.”
> 
> Enter cryptographically secure hashing. Write up your research in any fashion. Publish the SHA-512 hash of it, only, in a widely read forum. Inform Google of your findings privately. After Google has fixed the issue, publish your research, pointing to the earlier publication of the hash. All people professionally relevant to you will understand that they are certain, to far beyond the threshold they would need to bet their life savings on the matter, that you had the document as of the publication of the hash.
> 
> Importantly, this property of cryptographically secure hashing works for anyone. It is not magic. It is not simply a shibboleth or ritual unique to the security community. It is a reproducible technology, available to anyone, that makes guarantees backed by the present limits of human understanding of the world we live in and the math which governs it.
> 
> Any cryptography professor or clueful security engineer will tell you that the above is a layman’s gloss over effectively settled science, that it is secure enough to stake a material portion of the economy on, and that factually a material portion of the economy is staked on it this very second.
> How do you verify a dropped hash?
> 
> Download the file. Calculate the hash of the file, using the same algorithm that was used to produce it. The author will generally state this or consider it sufficiently implied by the length and structure of the hash. The author will likely use a well-understood algorithm generally considered by the community to be secure for this purpose. SHA-512 is one such algorithm.
> 
> Compare it to a hash previously posted someplace where the hash cannot be edited, generally a widely distributed location such as a mailing list or Twitter.
> 
> For example, if you are verifying a SHA-512 hash, you can do this using a command available on every modern operating system. If you don’t know how to do this, ask a technologist.
> 
>     shasum -a 512 name-of-the-file.txt
> 
> This will output the SHA-512 hash of that file. You can then compare it, via trivial use of the computer or visually, to the previously claimed hash.
> 
> If they match, and they should match exactly, then you know the file was beyond any reasonable doubt the file the author claimed to possess at the point of dropping the hash and that it has not been altered in the interim.

@patio11 wrote the above words as a very long footnote to https://www.kalzumeus.com/2020/04/21/japan-coronavirus/

