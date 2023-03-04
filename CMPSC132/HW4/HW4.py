# HW4
# REMINDER: The work in this assignment must be your own original work and must be completed alone.
# Don't forget to list any authorized forms of collaboration using a Collaboration Statement
# You might add additional methods to encapsulate and simplify the operations, but they must be
# thoroughly documented


class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None
        
    def __str__(self):
        return ("Node({})".format(self.value)) 

    __repr__ = __str__


class BinarySearchTree:
    '''
        >>> x=BinarySearchTree()
        >>> x.insert('mom')  
        >>> x.insert('omm') 
        >>> x.insert('mmo') 
        >>> x.root          
        Node({'mmo': ['mom', 'omm', 'mmo']})
        >>> x.insert('sat')
        >>> x.insert('kind')
        >>> x.insert('ats') 
        >>> x.root.left
        Node({'ast': ['sat', 'ats']})
        >>> x.root.right is None
        True
        >>> x.root.left.right
        Node({'dikn': ['kind']})
    '''

    def __init__(self):
        self.root = None


    # Modify the insert and _insert methods to allow the operations given in the PDF
    # Document all the modifications done
    def insert(self, value):
        if self.root is None:
            self.root=Node({"".join(sorted(value)):[value]})
        else:
            self._insert(self.root, value)


    def _insert(self, node, value):
        dictKey = "".join(sorted(value.lower()))
        if dictKey in node.value:
            node.value[dictKey].append(value)
        elif dictKey < list(node.value.keys())[0]:
            if node.left == None:
                node.left = Node({dictKey:[value]})
            else:
                self._insert(node.left, value)
        else:
            if node.right == None:
                node.right = Node({dictKey:[value]})
            else:
                self._insert(node.right, value)

    def isEmpty(self):
        return self.root == None

    @property
    def printInorder(self):
        if self.isEmpty(): 
            return None
        else:
            self._inorderHelper(self.root)
        
    def _inorderHelper(self, node):
        if node is not None:
            self._inorderHelper(node.left) 
            print(node.value, end=' : ') 
            self._inorderHelper(node.right)   

    



class Anagrams:
    '''
        # Verify class has _bst attribute  
        >>> x = Anagrams(5)
        >>> '_bst' in x.__dict__    
        True
        >>> isinstance(x.__dict__.get('_bst'), BinarySearchTree)
        True
        >>> x = Anagrams(5)
        >>> x.create('words_small.txt')
        >>> x.getAnagrams('tap')
        'No match'
        >>> x.getAnagrams('arm')
        'No match'
        >>> x.getAnagrams('rat')
        ['art', 'tar', 'rat']
        >>> x._bst.printInorder
        {'a': ['a']} : {'adns': ['ands', 'sand']} : {'ahms': ['sham', 'hams']} : {'amt': ['tam', 'mat']} : {'arst': ['arts', 'rats', 'star']} : {'arsty': ['artsy']} : {'art': ['art', 'tar', 'rat']} : 
    '''
    
    def __init__(self, word_size):
        self.word_size = word_size
        self._bst = BinarySearchTree()



    def create(self, file_name):
        with open(file_name) as f:
            contents = f.read()
        for word in contents.split():
            if len(word) <= self.word_size:
                self._bst.insert(word)


    def getAnagrams(self, word):
        top = self._bst.root
        dictKey = "".join(sorted(word))
        while top is not None:
            if dictKey in top.value:
                return top.value[dictKey]
            elif dictKey < list(top.value.keys())[0]:
                top = top.left
            else:
                top = top.right
        return "No match"

if __name__ == "__main__":
    import doctest
    doctest.run_docstring_examples(Anagrams, globals(), name='HW4',verbose=True)


