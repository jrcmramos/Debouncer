# Description

Debouncer implementation to dispatch `blocks` into a `DispatcherQueue`.

# Usage

```Swift

func userDidSearch(for searchString: String) {
    self.debouncer.debounce { [weak self] in
        self?.viewModel.send(.userSearch(searchString))
    }
}

```