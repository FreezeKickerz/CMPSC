# HW5
# REMINDER: The work in this assignment must be your own original work and must be completed alone.
# Don't forget to list any authorized forms of collaboration using a Collaboration Statement

class Node:
    def __init__(self, content):
        self.value = content
        self.next = None

    def __str__(self):
        return ('CONTENT:{}\n'.format(self.value))

    __repr__=__str__


class ContentItem:
    '''
        >>> content1 = ContentItem(1000, 10, "Content-Type: 0", "0xA")
        >>> content2 = ContentItem(1004, 50, "Content-Type: 1", "110010")
        >>> content3 = ContentItem(1005, 18, "Content-Type: 2", "<html><p>'CMPSC132'</p></html>")
        >>> content4 = ContentItem(1005, 18, "another header", "111110")
        >>> hash(content1)
        0
        >>> hash(content2)
        1
        >>> hash(content3)
        2
        >>> hash(content4)
        1
    '''
    def __init__(self, cid, size, header, content):
        self.cid = cid
        self.size = size
        self.header = header
        self.content = content

    def __str__(self):
        return f'CONTENT ID: {self.cid} SIZE: {self.size} HEADER: {self.header} CONTENT: {self.content}'

    __repr__=__str__

    def __eq__(self, other):
        if isinstance(other, ContentItem):
            return self.cid == other.cid and self.size == other.size and self.header == other.header and self.content == other.content
        return False

    def __hash__(self):
        # YOUR CODE STARTS HERE
        sum = 0
        for letter in self.header:
            sum += ord(letter)
        return sum % 3
        



class CacheList:
    ''' 
        # An extended version available on Canvas. Make sure you pass this doctest first before running the extended version

        >>> content1 = ContentItem(1000, 10, "Content-Type: 0", "0xA")
        >>> content2 = ContentItem(1004, 50, "Content-Type: 1", "110010")
        >>> content3 = ContentItem(1005, 180, "Content-Type: 2", "<html><p>'CMPSC132'</p></html>")
        >>> content4 = ContentItem(1006, 18, "another header", "111110")
        >>> content5 = ContentItem(1008, 2, "items", "11x1110")
        >>> lst=CacheList(200)
        >>> lst
        REMAINING SPACE:200
        ITEMS:0
        LIST:
        <BLANKLINE>
        >>> lst.put(content1, 'mru')
        'INSERTED: CONTENT ID: 1000 SIZE: 10 HEADER: Content-Type: 0 CONTENT: 0xA'
        >>> lst.put(content2, 'lru')
        'INSERTED: CONTENT ID: 1004 SIZE: 50 HEADER: Content-Type: 1 CONTENT: 110010'
        >>> lst.put(content4, 'mru')
        'INSERTED: CONTENT ID: 1006 SIZE: 18 HEADER: another header CONTENT: 111110'
        >>> lst.put(content5, 'mru')
        'INSERTED: CONTENT ID: 1008 SIZE: 2 HEADER: items CONTENT: 11x1110'
        >>> lst.put(content3, 'lru')
        "INSERTED: CONTENT ID: 1005 SIZE: 180 HEADER: Content-Type: 2 CONTENT: <html><p>'CMPSC132'</p></html>"
        >>> lst.put(content1, 'mru')
        'INSERTED: CONTENT ID: 1000 SIZE: 10 HEADER: Content-Type: 0 CONTENT: 0xA'
        >>> 1006 in lst
        True
        >>> contentExtra = ContentItem(1034, 2, "items", "other content")
        >>> lst.update(1008, contentExtra)
        'UPDATED: CONTENT ID: 1034 SIZE: 2 HEADER: items CONTENT: other content'
        >>> lst
        REMAINING SPACE:170
        ITEMS:3
        LIST:
        [CONTENT ID: 1034 SIZE: 2 HEADER: items CONTENT: other content]
        [CONTENT ID: 1006 SIZE: 18 HEADER: another header CONTENT: 111110]
        [CONTENT ID: 1000 SIZE: 10 HEADER: Content-Type: 0 CONTENT: 0xA]
        <BLANKLINE>
        >>> lst.clear()
        'Cleared cache!'
        >>> lst
        REMAINING SPACE:200
        ITEMS:0
        LIST:
        <BLANKLINE>
    '''
    def __init__(self, size):
        self.head = None
        self.maxSize = size
        self.remainingSpace = size
        self.numItems = 0

    def __str__(self):
        listString = ""
        current = self.head
        while current is not None:
            listString += "[" + str(current.value) + "]\n"
            current = current.next
        return 'REMAINING SPACE:{}\nITEMS:{}\nLIST:\n{}'.format(self.remainingSpace, self.numItems, listString)  

    __repr__=__str__

    def __len__(self):
        return self.numItems
    
    def put(self, content, evictionPolicy):
        # YOUR CODE STARTS HERE
        if content.size > self.maxSize:
            return "Insertion not allowed"
        elif content.cid in self:
            return f"Content {content.cid} already in cache, insertion not allowed"
        else:
            while self.remainingSpace < content.size:
                if evictionPolicy == "lru":
                    self.lruEvict()
                if evictionPolicy == "mru":
                    self.mruEvict()
            self.remainingSpace -= content.size
            self.numItems += 1
            new_node = Node(content)
            new_node.next = self.head
            self.head = new_node
            return f"INSERTED: {content}" 


    

    def __contains__(self, cid):
        # YOUR CODE STARTS HERE
        if len(self) == 0:
            return False
        elif len (self) == 1:
            if self.head.value.cid == cid:
                return True
            else:
                return False
        previous_node = None
        current_node = self.head
        while current_node is not None:
            if current_node.value.cid == cid:
                if current_node.next is not None:
                    previous_node.next = current_node.next
                    current_node.next = self.head
                    self.head = current_node
                    return True
                else:
                    previous_node.next = None
                    current_node.next = self.head
                    self.head = current_node
                    return True
            previous_node = current_node
            current_node = current_node.next
        return False 


    def update(self, cid, content):
        # YOUR CODE STARTS HERE
        if cid in self:
            space = self.remainingSpace + self.head.value.size
            if not content.size > space:
                self.head.value = content
                return f"UPDATED: {content}"
            else:
                return "Cache miss!"
        return "Cache miss!"



    def mruEvict(self):
        # YOUR CODE STARTS HERE
        if self.numItems == 0:
            self.clear()
            return
        if self.numItems == 1:
            self.remainingSpace = self.maxSize
            self.clear()
            return
        space = self.head.value.size
        self.head = self.head.next
        self.numItems -= 1
        self.remainingSpace += space
        

    
    def lruEvict(self):
        # YOUR CODE STARTS HERE
        if self.numItems == 0:
            self.clear()
            return
        elif self.numItems == 1:
            self.clear()
            return
        current_node = self.head
        previous_node = None
        while current_node.next is not None:
            previous_node = current_node
            current_node = current_node.next
        previous_node.next = None
        self.remainingSpace += current_node.value.size
        self.numItems -= 1

    
    def clear(self):
        # YOUR CODE STARTS HERE
        self.head = None
        self.next = None
        self.remainingSpace = self.maxSize
        self.numItems = 0
        return "Cleared cache!"



class Cache:
    """
            # An extended version available on Canvas. Make sure you pass this doctest first before running the extended version

            >>> cache = Cache()
            >>> content1 = ContentItem(1000, 10, "Content-Type: 0", "0xA")
            >>> content2 = ContentItem(1003, 13, "Content-Type: 0", "0xD")
            >>> content3 = ContentItem(1008, 242, "Content-Type: 0", "0xF2")

            >>> content4 = ContentItem(1004, 50, "Content-Type: 1", "110010")
            >>> content5 = ContentItem(1001, 51, "Content-Type: 1", "110011")
            >>> content6 = ContentItem(1007, 155, "Content-Type: 1", "10011011")

            >>> content7 = ContentItem(1005, 18, "Content-Type: 2", "<html><p>'CMPSC132'</p></html>")
            >>> content8 = ContentItem(1002, 14, "Content-Type: 2", "<html><h2>'PSU'</h2></html>")
            >>> content9 = ContentItem(1006, 170, "Content-Type: 2", "<html><button>'Click Me'</button></html>")

            >>> cache.insert(content1, 'lru')
            'INSERTED: CONTENT ID: 1000 SIZE: 10 HEADER: Content-Type: 0 CONTENT: 0xA'
            >>> cache.insert(content2, 'lru')
            'INSERTED: CONTENT ID: 1003 SIZE: 13 HEADER: Content-Type: 0 CONTENT: 0xD'
            >>> cache.insert(content3, 'lru')
            'Insertion not allowed'

            >>> cache.insert(content4, 'lru')
            'INSERTED: CONTENT ID: 1004 SIZE: 50 HEADER: Content-Type: 1 CONTENT: 110010'
            >>> cache.insert(content5, 'lru')
            'INSERTED: CONTENT ID: 1001 SIZE: 51 HEADER: Content-Type: 1 CONTENT: 110011'
            >>> cache.insert(content6, 'lru')
            'INSERTED: CONTENT ID: 1007 SIZE: 155 HEADER: Content-Type: 1 CONTENT: 10011011'

            >>> cache.insert(content7, 'lru')
            "INSERTED: CONTENT ID: 1005 SIZE: 18 HEADER: Content-Type: 2 CONTENT: <html><p>'CMPSC132'</p></html>"
            >>> cache.insert(content8, 'lru')
            "INSERTED: CONTENT ID: 1002 SIZE: 14 HEADER: Content-Type: 2 CONTENT: <html><h2>'PSU'</h2></html>"
            >>> cache.insert(content9, 'lru')
            "INSERTED: CONTENT ID: 1006 SIZE: 170 HEADER: Content-Type: 2 CONTENT: <html><button>'Click Me'</button></html>"
            >>> cache
            L1 CACHE:
            REMAINING SPACE:177
            ITEMS:2
            LIST:
            [CONTENT ID: 1003 SIZE: 13 HEADER: Content-Type: 0 CONTENT: 0xD]
            [CONTENT ID: 1000 SIZE: 10 HEADER: Content-Type: 0 CONTENT: 0xA]
            <BLANKLINE>
            L2 CACHE:
            REMAINING SPACE:45
            ITEMS:1
            LIST:
            [CONTENT ID: 1007 SIZE: 155 HEADER: Content-Type: 1 CONTENT: 10011011]
            <BLANKLINE>
            L3 CACHE:
            REMAINING SPACE:16
            ITEMS:2
            LIST:
            [CONTENT ID: 1006 SIZE: 170 HEADER: Content-Type: 2 CONTENT: <html><button>'Click Me'</button></html>]
            [CONTENT ID: 1002 SIZE: 14 HEADER: Content-Type: 2 CONTENT: <html><h2>'PSU'</h2></html>]
            <BLANKLINE>
            <BLANKLINE>
        """


    def __init__(self):
        self.hierarchy = [CacheList(200), CacheList(200), CacheList(200)]
        self.size = 3
    
    def __str__(self):
        return ('L1 CACHE:\n{}\nL2 CACHE:\n{}\nL3 CACHE:\n{}\n'.format(self.hierarchy[0], self.hierarchy[1], self.hierarchy[2]))
    
    __repr__=__str__


    def clear(self):
        for item in self.hierarchy:
            item.clear()
        return 'Cache cleared!'

    
    def insert(self, content, evictionPolicy):
        # YOUR CODE STARTS HERE
        return self.hierarchy[hash(content)].put(content, evictionPolicy)



    def __getitem__(self, content):
        # YOUR CODE STARTS HERE
        if content in self.hierarchy[hash(content)]:
            return self.hierarchy[hash(content)]
        else:
            return "Cache miss!"



    def updateContent(self, content):
        # YOUR CODE STARTS HERE
        return self.hierarchy[hash(content)].update(content.cid,content)


if __name__ == "__main__":
    import doctest
    doctest.run_docstring_examples(CacheList, globals(), name='HW5',verbose=True)
   