# LAB7
# REMINDER: The work in this assignment must be your own original work and must be completed alone.
# Don't forget to list any authorized forms of collaboration using a Collaboration Statement

class MinBinaryHeap:
    '''
        >>> h = MinBinaryHeap()
        >>> h.insert(10)
        >>> h.insert(5)
        >>> h
        [5, 10]
        >>> h.insert(14)
        >>> h._heap
        [5, 10, 14]
        >>> h.insert(9)
        >>> h
        [5, 9, 14, 10]
        >>> h.insert(2)
        >>> h
        [2, 5, 14, 10, 9]
        >>> h.insert(11)
        >>> h
        [2, 5, 11, 10, 9, 14]
        >>> h.insert(14)
        >>> h
        [2, 5, 11, 10, 9, 14, 14]
        >>> h.insert(20)
        >>> h
        [2, 5, 11, 10, 9, 14, 14, 20]
        >>> h.insert(20)
        >>> h
        [2, 5, 11, 10, 9, 14, 14, 20, 20]
        >>> h.getMin
        2
        >>> h._leftChild(1)
        5
        >>> h._rightChild(1)
        11
        >>> h._parent(1)
        >>> h._parent(6)
        11
        >>> h._leftChild(6)
        >>> h._rightChild(9)
        >>> h.deleteMin()
        2
        >>> h._heap
        [5, 9, 11, 10, 20, 14, 14, 20]
        >>> h.deleteMin()
        5
        >>> h
        [9, 10, 11, 20, 20, 14, 14]
        >>> len(h)
        7
        >>> h.getMin
        9
    '''

    def __init__(self):   # YOU ARE NOT ALLOWED TO MODIFY THE CONSTRUCTOR
        self._heap=[]
        
    def __str__(self):
        return f'{self._heap}'

    __repr__=__str__

    def __len__(self):
        return len(self._heap)

    @property
    def getMin(self):
        if len(self._heap) == 0:
            return None
        else:
            return self._heap[0]
    
    
    def _parent(self,index):
        if index < 2:
           return None
        else:
            try:
                return self._heap[(index-2)//2]
            except:
                return None


    def _leftChild(self,index):
        try:
            return self._heap[2 * index - 1]
        except:
            return None



    def _rightChild(self,index):
        try:
            return self._heap[2 * index]
        except:
            return None


    def insert(self,item):
        if len(self._heap) == 0:
           self._heap.append(item)
        else:
            self._heap.append(item)
            index = len(self._heap) - 1
            parent = (index-1)//2
            while index > 0 and self._heap[index] < self._heap[parent]:
                self._heap[index], self._heap[parent] = self._heap[parent],self._heap[index] 
                index = (index-1)//2
                parent = (index-1)//2
            

    def deleteMin(self):
        # Remove from an empty heap or a heap of size 1
        if len(self)==0:
            return None        
        elif len(self)==1:
            deleted=self._heap[0]
            self._heap=[]
            return deleted
        else:
            min = self._heap[0]
            index = len(self._heap) -1
            index = (index-1)//2
            parent = (index-1)//2
            while index > 0:
                if self._heap[index] < self._heap[parent]:
                    self._heap[index], self._heap[parent] = self._heap[parent],self._heap[index] 
                    index = (index-1)//2
                    parent = (index-1)//2
                    index = index - 1
                else:
                    index = index -1
            self._heap.pop(0)
            return min




def heapSort(numList):
    '''
       >>> heapSort([9,1,7,4,1,2,4,8,7,0,-1,0])
       [-1, 0, 0, 1, 1, 2, 4, 4, 7, 7, 8, 9]
       >>> heapSort([-15, 1, 0, -15, -15, 8 , 4, 3.1, 2, 5])
       [-15, -15, -15, 0, 1, 2, 3.1, 4, 5, 8]
    '''
    # YOUR CODE STARTS HERE
    pass


if __name__ == "__main__":
    import doctest
    doctest.run_docstring_examples(MinBinaryHeap, globals(), name='LAB7',verbose=True)