class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None
        
    def __str__(self):
        return ("Node({})".format(self.value)) 

    __repr__ = __str__


class BinarySearchTree:

    def __init__(self):
        self.root = None
    
    def insert(self, value): # Simplified version of insert using a helper method
        if self.root is None:
            self.root=Node(value)
        else:
            self._insert(self.root, value)

    def _insert(self, node, value):
        if(value<node.value):
            if(node.left==None):
                node.left = Node(value)
            else:
                self._insert(node.left, value)
        else:      # This will allow repeated values to be placed in the tree. To avoid this, we do: elif(value>node.value):
            if(node.right==None):
                node.right = Node(value)
            else:
                self._insert(node.right, value)
    

    def __delitem__(self, value):
        self._deleteHelper(None, self.root, value)
        return self.printInorder
    
    def _deleteHelper(self, parent, current, value):
        if current is None:
            return None
        if current.value > value:
            self._deleteHelper(current,current.left,value)
        elif current.value < value:
            self._deleteHelper(current,current.right,value)
        else:
            node_children=self.numChildren(current)
            if node_children==0 or node_children==1:
                if current.left is not None:
                    child = current.left
                else:
                    child = current.right
                if (parent is not None) and (parent.left is current):
                    parent.left = child
                elif (parent is not None) and (parent.right is current):
                    parent.right = child
                else:
                    self.root = child
            else:
                temp = current.right
                parent = current
                while temp.left is not None:
                    parent = temp
                    temp = temp.left
                current.value = temp.value
                self._deleteHelper(parent,temp,temp.value)


    def numChildren(self, node):
        if node.left is None and node.right is None:
            return 0
        elif node.left is None or node.right is None:
            return 1
        else:
            return 2

    
    @property
    def printInorder(self):
        self._inorderHelper(self.root)      

    def _inorderHelper(self, node):
        if node is not None:
            self._inorderHelper(node.left)
            print(node.value, end=' : ')
            self._inorderHelper(node.right) 

bst_keys = [3, 2, 5, 4, 9, 3.5, 6]
t = BinarySearchTree()
for key in bst_keys:
    t.insert(key)

print(t.numChildren(t.root))              # Displays 2
print(t.numChildren(t.root.left))         # Displays 0
print(t.numChildren(t.root.right))        # Displays 2
print(t.numChildren(t.root.right.right))  # Displays 1